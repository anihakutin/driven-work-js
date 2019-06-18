class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.date :year_founded
      t.integer :user_id
      t.integer :ceo_id

      t.timestamps null: false
    end
  end
end
