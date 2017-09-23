class AddRatingToSite < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :rating, :integer, default: 0
  end
end
