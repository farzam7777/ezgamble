class AddTitleToSite < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :title, :string
  end
end
