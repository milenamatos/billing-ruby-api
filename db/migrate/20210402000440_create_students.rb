class CreateStudents < ActiveRecord::Migration[6.1]
  def change    
    create_table :students do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :document, limit: 11, null: false, index: {unique: true}
      t.date :birth_date
      t.integer :telephone

      t.timestamps
    end
  end
end
