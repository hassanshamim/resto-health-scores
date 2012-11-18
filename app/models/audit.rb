class Audit < ActiveRecord::Base
  attr_accessible :address, :date, :name, :score
  validates :date, :score, :presence => true
  validates :score, :numericality => true
  belongs_to :restaurant
end
