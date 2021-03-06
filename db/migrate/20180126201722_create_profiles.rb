class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :first_name
      t.string :last_name
      t.string :image_url
      t.date :birth_date
      t.string :birth_city
      t.integer :language, default: 0

      t.timestamps
    end
  end
end
