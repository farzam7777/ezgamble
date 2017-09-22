class Site < ApplicationRecord
  belongs_to :category
  
  has_attached_file :preview, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :preview, content_type: /\Aimage\/.*\z/
  
  validates_presence_of :title
  validates_presence_of :link
  validates_presence_of :preview
  validates_presence_of :description
  validates :description, length: { minimum: 90 }
end
