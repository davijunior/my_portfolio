class CreatePersonalInfos < ActiveRecord::Migration[7.2]
  def change
    create_table :personal_infos do |t|
      t.text :bio
      t.text :hobbies
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
