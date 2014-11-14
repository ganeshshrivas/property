class Estate < ActiveRecord::Base
  belongs_to :user
  has_one :location
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures
  scope :within_radius, lambda {|latitude, longitude, metres| where("earth_box(ll_to_earth(?, ?), ?) @> ll_to_earth(latitude, longitude)", latitude, longitude, metres) }

end
