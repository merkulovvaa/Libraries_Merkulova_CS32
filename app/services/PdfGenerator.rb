class PdfGenerator
  def self.call(element)
    Prawn::Document.new do
      fill_color "3399FF"
      image "public/library.jpg", :width => 100, :height => 80
      text "________________________"
      text "\nName: #{element.name}"
      text "Address: #{element.address}"
      text "\nUsers:\n"
      element.reader_cards.each do |reader_card|
          text "#{reader_card.user.full_name}"
        end
    end.render
  end
end