class Audit < ActiveRecord::Base
  attr_accessible :address, :date, :name, :score
  validates_presence_of [:address, :date, :name, :score]
end
