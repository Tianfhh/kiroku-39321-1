class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|

      t.references :user, null: false, foreign_key: true
      t.string :category, null: false
      t.decimal :amount, null: false
      t.date :date, null: false
      
      t.timestamps
    end
  end
end
