class Trust < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :site_id
end
