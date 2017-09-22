class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :link
      t.text :description

      t.timestamps
    end
  end
end
