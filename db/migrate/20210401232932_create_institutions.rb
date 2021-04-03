class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :document, limit: 14, index: {unique: true}

      t.timestamps
    end
  end
end
