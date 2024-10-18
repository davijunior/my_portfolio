class CreateProfessionalInfos < ActiveRecord::Migration[7.2]
  def change
    create_table :professional_infos do |t|
      t.string :title
      t.string :company
      t.integer :years_experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
