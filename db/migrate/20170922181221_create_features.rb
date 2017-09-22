class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :site_id

      t.timestamps
    end
  end
end
