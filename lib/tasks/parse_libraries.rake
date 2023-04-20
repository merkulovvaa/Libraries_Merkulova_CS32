require 'nokogiri'
require 'open-uri'
require 'csv'

namespace :library do
  desc "Parse page and add library names to database from website"
  task :parse_website => :environment do
    url = "https://en.wikipedia.org/wiki/List_of_libraries"
    doc = Nokogiri::HTML(URI.open(url))
    doc.css("#mw-content-text > div.mw-parser-output > ul").each do |ul|
      ul.css('li').each do |row|
        Library.create(name: row.text, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.phone_number)
      end
    end
  end

  desc "Parse page and add library names to database from file"
  task :parse_file => :environment do
    libraries = CSV.read('public/libraries_5.csv', headers: true)
    libraries.each do |row|
      library = Library.new(
          name: row['Library Name'],
          address: row['Street Address'],
          city: row['City'],
          zip_code: row['Zip Code'],
          phone_number: Faker::PhoneNumber.phone_number,
          year: row['Submission Year']
        )
      puts library
         end
  end
end