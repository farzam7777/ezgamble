class AddCategoryIdToSite < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :category_id, :integer
  end
end
