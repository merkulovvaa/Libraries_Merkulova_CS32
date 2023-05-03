class PdfGeneratorUser
  def self.call(business_model)
    Prawn::Document.new do
      business_model.each do |element|
        text "________________________"
        text "\nFull name: #{element.full_name}", :color => "990099"
        text "\nEmail: #{element.email}", :color => "990099"
        text "\nBirthday: #{element.birth_date}", :color => "990099"
      end
    end.render
  end
end