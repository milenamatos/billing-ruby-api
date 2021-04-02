class DropInstitutionType < ActiveRecord::Migration[6.1]
  def change
    drop_table :institution_types
  end
end
