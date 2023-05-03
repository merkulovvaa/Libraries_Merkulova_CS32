class DownloaderController < ApplicationController

  def downloadAll
    send_data PdfGeneratorAll.call(Library.all),
              filename: "Libraries.pdf",
              type: "application/pdf"
  end

  def download
    send_data PdfGenerator.call(Library.find(params[:id])),
              filename: "#{Library.find(params[:id]).name}.pdf",
              type: "application/pdf"
  end

  def downloadUsers
    send_data PdfGeneratorUser.call(User.all),
              filename: "Users.pdf",
              type: "application/pdf"
  end

  def downloadCsv
    send_data CsvGenerator.call(Library.all),
              filename: "Libraries.csv",
              type: "application/csv"
  end

end
