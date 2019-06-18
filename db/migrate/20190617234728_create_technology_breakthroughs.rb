class CreateTechnologyBreakthroughs < ActiveRecord::Migration[5.2]
  def change
    create_table :technology_breakthroughs do |t|
      t.string :name
      t.string :description
      t.date :year
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
