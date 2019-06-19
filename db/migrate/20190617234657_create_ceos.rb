class CreateCeos < ActiveRecord::Migration[5.2]
  def change
    create_table :ceos do |t|
      t.string :name
      t.integer :year_born
      t.decimal :net_worth

      t.timestamps null: false
    end
  end
end
