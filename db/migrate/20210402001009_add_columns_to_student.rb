class AddColumnsToStudent < ActiveRecord::Migration[6.1]
  execute <<-SQL
      CREATE TYPE gender_type AS ENUM ('M', 'F');
    SQL
    execute <<-SQL
      CREATE TYPE payment_method AS ENUM ('Boleto', 'Cartão');
    SQL
  def change
    add_column :students, :gender, :gender_type, null: false
    add_column :students, :payment, :payment_method, null: false
  end
end
