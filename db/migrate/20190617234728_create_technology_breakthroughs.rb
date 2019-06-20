class CreateTechnologyBreakthroughs < ActiveRecord::Migration[5.2]
  def change
    create_table :technology_breakthroughs do |t|
      t.string :name
      t.string :description
      t.integer :year, null: false, default: 0
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
