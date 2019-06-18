class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.string :name
      t.string :description
      t.integer :year_solved, null: false, default: 0
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
