class AddColumnsToLibraries < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :year, :integer
    add_column :libraries, :city, :string
    add_column :libraries, :zip_code, :integer
  end
end
