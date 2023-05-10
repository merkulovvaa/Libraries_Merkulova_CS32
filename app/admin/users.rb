ActiveAdmin.register User do
  permit_params :birth_date, :email, :full_name, reader_cards_attributes: [:id, :card_number, :_destroy]

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :birth_date
    column :reader_cards do |user|
      user.reader_cards.map(&:id).join(', ')
    end
    actions
  end

  filter :full_name
  filter :birth_date

  show do
    attributes_table do
      row :full_name
      row :email
      row :birth_date
      row :reader_cards do |user|
        user.reader_cards.map(&:id).join(', ')
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :email
      f.input :birth_date
      f.has_many :reader_cards, allow_destroy: true do |card|
        card.input :id
      end
    end
    f.actions
  end
end
