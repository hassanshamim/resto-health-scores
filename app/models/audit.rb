class Audit < ActiveRecord::Base
  attr_accessible :address, :date, :name, :score
end
