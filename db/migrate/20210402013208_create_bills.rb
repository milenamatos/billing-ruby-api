class CreateBills < ActiveRecord::Migration[6.1]
  execute <<-SQL
    CREATE TYPE bill_type AS ENUM ('Aberta', 'Atrasada', 'Paga');
  SQL

  def change
    create_table :bills do |t|
      t.float :price, null: false
      t.date :due_date, null: false
      t.references :registration, null: false, foreign_key: true

      t.timestamps
    end

    add_column :bills, :status, :bill_type, null: false, default: 'Aberta'
  end
end
