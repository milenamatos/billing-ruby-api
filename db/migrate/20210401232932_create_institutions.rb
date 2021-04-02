class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :document, limit: 14, index: {unique: true}
      t.references :institution_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
