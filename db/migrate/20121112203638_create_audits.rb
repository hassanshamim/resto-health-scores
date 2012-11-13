class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.string :name
      t.date :date
      t.integer :score
      t.string :address

      t.timestamps
    end
  end
end
