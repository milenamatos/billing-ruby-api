class CreateInstitutionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :institution_types do |t|
      t.string :name, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
