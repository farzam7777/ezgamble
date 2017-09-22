class AddAttachmentPreviewToSites < ActiveRecord::Migration[5.1]
  def self.up
    change_table :sites do |t|
      t.attachment :preview
    end
  end

  def self.down
    remove_attachment :sites, :preview
  end
end
