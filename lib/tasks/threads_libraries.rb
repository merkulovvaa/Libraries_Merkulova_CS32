require 'nokogiri'
require 'open-uri'
require 'csv'

namespace :library do
  desc "Parse page and add library names to database from website"
  task :parse_website => :environment do
    url = "https://en.wikipedia.org/wiki/List_of_libraries"
    doc = Nokogiri::HTML(URI.open(url))

    libraries = []
    library_mutex = Mutex.new

    threads = []

    doc.css("#mw-content-text > div.mw-parser-output > ul").each_slice(50) do |ul_slice|
      threads << Thread.new(ul_slice) do |slice|
        slice.each do |ul|
          ul.css('li').each do |row|
            library_mutex.synchronize do
              libraries << { name: row.text, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.phone_number }
            end
          end
        end
      end
    end

    threads.each(&:join)

    puts "Adding #{libraries.count} libraries to the database..."

    library_threads = []

    libraries.each_slice(ENV.fetch("RAILS_MAX_THREADS") { 20 }) do |slice|
      library_threads << Thread.new(slice) do |slice_libraries|
        slice_libraries.each do |library|
          library_mutex.synchronize do
            Library.create(name: library[:name], address: library[:address], phone_number: library[:phone_number])
          end
        end
      end
    end

    library_threads.each(&:join)
  end

  desc "Parse page and add library names to database from file"
  task :parse_file => :environment do
    libraries = CSV.read('public/libraries_5.csv', headers: true)

    parsed_libraries = []
    library_mutex = Mutex.new

    threads = []

    libraries.each_slice(100) do |library_slice|
      threads << Thread.new(library_slice) do |slice|
        slice.each do |row|
          parsed_library = Library.new(
              name: row['Library Name'],
              address: row['Street Address'],
              city: row['City'],
              zip_code: row['Zip Code'],
              phone_number: Faker::PhoneNumber.phone_number,
              year: row['Submission Year']
          )
          library_mutex.synchronize do
            parsed_libraries << parsed_library
          end
        end
      end
    end

    threads.each(&:join)

    puts "Adding #{parsed_libraries.count} libraries to the database..."

    library_threads = []

    parsed_libraries.each_slice(ENV.fetch("RAILS_MAX_THREADS") { 20 }) do |slice|
      library_threads << Thread.new(slice) do |slice_libraries|
        slice_libraries.each do |library|
          library_mutex.synchronize do
            library.save
          end
        end
      end
    end

    library_threads.each(&:join)
  end
end
