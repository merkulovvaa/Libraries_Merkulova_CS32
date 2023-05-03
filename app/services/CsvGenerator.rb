require 'csv'

class CsvGenerator
  def self.call(business_model)
    CSV.generate(headers: true) do |csv|
      csv << %w[library address users]
      business_model.each do |element|
        users= ''
        element.reader_cards.each do |reader_card|
            users += "#{reader_card.user.full_name};"
          end
        csv << [element.name, element.address, users]
      end
    end
  end
end
