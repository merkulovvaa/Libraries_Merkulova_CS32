class LibrariesInfoQuery
  def initialize(params)
    @sort_by = params[:sort_by] || "id"
    @search_term = params[:search_term]
  end

  def results
    libraries = Library.all
    libraries = libraries.where("name LIKE ?", "%#{@search_term}%") if @search_term
    libraries = case @sort_by
    when "books.count"
      Library.select("libraries.*, COUNT(books.id) AS books_count")
          .joins("LEFT JOIN books ON libraries.id = books.library_id")
          .group("libraries.id")
          .order("books_count DESC")
    when "genres.count"
      Library.select("libraries.*, COUNT(DISTINCT genres.id) AS genres_count")
          .joins(:books)
          .joins("LEFT JOIN book_genres ON books.id = book_genres.book_id")
          .joins("LEFT JOIN genres ON book_genres.genre_id = genres.id")
          .group("libraries.id")
          .order("genres_count DESC")

    else
      libraries
    end
  end
end

