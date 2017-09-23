class Review < ApplicationRecord
  belongs_to :user
  belongs_to :site
  
  validates_presence_of :title
  validates_presence_of :content
end
