class RemoveInstitutionTypeFromInstitution < ActiveRecord::Migration[6.1]
  def change
    remove_column :institutions, :institution_type_id, :integer
  end
end
