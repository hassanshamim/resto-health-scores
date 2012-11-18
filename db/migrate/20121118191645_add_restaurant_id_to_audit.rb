class AddRestaurantIdToAudit < ActiveRecord::Migration
  def change
    change_table :audits do |t|
      t.references :restaurant
    end
  end
end
