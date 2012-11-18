class Restaurant < ActiveRecord::Base
  attr_accessible :address, :name
  validates :name, :uniqueness => { :scope => :address,
    :message => "should only have one restaurant per location"}
  validates :name, :address, :presence => true
  has_many :audits, :dependent => :destroy
  before_save do |resto|
    resto.name = resto.name.titleize
    resto.address = resto.address.titleize
  end
end
