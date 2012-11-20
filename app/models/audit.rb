class Audit < ActiveRecord::Base
  attr_accessible :date, :score
  validates :date, :score, :restaurant, :presence => true
  validates :score, :numericality => true
  belongs_to :restaurant
end
