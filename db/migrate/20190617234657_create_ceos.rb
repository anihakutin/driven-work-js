class CreateCeos < ActiveRecord::Migration[5.2]
  def change
    create_table :ceos do |t|
      t.string :name
      t.integer :age
      t.integer :net_worth

      t.timestamps null: false
    end
  end
end
