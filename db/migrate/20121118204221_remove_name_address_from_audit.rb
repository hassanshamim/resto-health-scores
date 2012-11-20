class RemoveNameAddressFromAudit < ActiveRecord::Migration
  def up
    Audit.reset_column_information
    Audit.all.each do | audit |
      Restaurant.reset_column_information
      resto = Restaurant.where( :name => audit.name.titleize,
                               :address =>audit.address.titleize )
      if resto.empty?
        r = Restaurant.create( name: audit.name, address: audit.address )
        audit.restaurant = r
      else
        audit.restaurant = resto.first
      end
      audit.save
    end
    remove_column :audits, :name
    remove_column :audits, :address
  end

  def down
    add_column :audits, :name, :string
    add_column :audits, :address, :string
    Audit.reset_column_information
    Audit.all.each do |audit|
      audit.update_attributes!(:restaurant_id => nil)
    end
  end
end
