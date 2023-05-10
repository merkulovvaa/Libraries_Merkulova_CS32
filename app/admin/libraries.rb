ActiveAdmin.register Library do
  permit_params :address, :year, :name, :phone_number

  config.clear_action_items!
  index do
    selectable_column
    id_column
    column :name
    column :address
    column :year
    column :phone_number
    actions
    end

  filter :name
  filter :books

  show do
    attributes_table do
      row :name
      row :address
      row :year
      row :phone_number
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors # Show error messages on :base instead of each attribute

    f.inputs do
      f.input :name
      f.input :address
      f.input :phone_number
      f.input :year
    end
    f.actions # Add buttons to submit/save and cancel
  end
end
