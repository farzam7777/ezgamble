class Site < ApplicationRecord
  belongs_to :category
  has_many :features
  has_many :performances
  has_many :trusts
  has_many :reviews
    
  has_attached_file :preview, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :preview, content_type: /\Aimage\/.*\z/,
  default_url: ActionController::Base.helpers.asset_path("missing_site.jpg")
  
  validates_presence_of :title
  validates_presence_of :link
  validates_presence_of :preview
  validates_presence_of :description
  validates :description, length: { minimum: 90 }
  
  def get_site_avg_rating(site)
    trusts = site.trusts.average(:rating).to_i
    performances = site.performances.average(:rating).to_i
    features = site.features.average(:rating).to_i
    
    result = ( ( features + performances + trusts ) / 3 ).to_i
  end
end
