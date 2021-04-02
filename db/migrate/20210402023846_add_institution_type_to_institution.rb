class AddInstitutionTypeToInstitution < ActiveRecord::Migration[6.1]
  execute <<-SQL
    CREATE TYPE category AS ENUM ('Universidade', 'Escola', 'Creche');
  SQL
  def change
    add_column :institutions, :institution_type, :category, null: false
  end
end
