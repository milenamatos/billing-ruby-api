class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.float :total_price, null: false
      t.integer :bill_quantity, null: false
      t.integer :due_date, null: false
      t.string :course_name, null: false
      t.references :institution, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
