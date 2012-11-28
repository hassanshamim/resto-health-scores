class Audit < ActiveRecord::Base
  attr_accessible :date, :score, :restaurant
  validates :date, :score, :restaurant, :presence => true
  validates :score, :numericality => true
  validates :date, :uniqueness => { :scope => :restaurant_id,
    :message => "A restaurant may not have more than one audit per day" }
  belongs_to :restaurant
end
