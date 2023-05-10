ActiveAdmin.register Book do
  permit_params :title, :year, genre_ids: [], author_ids: []

  index do
    selectable_column
    id_column
    column :title
    column :year
    column :genres do |book|
      book.genres.pluck(:name).join(", ")
    end
    column :authors do |book|
      book.authors.pluck(:full_name).join(", ")
    end
    actions
  end
end
