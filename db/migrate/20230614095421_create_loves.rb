class CreateLoves < ActiveRecord::Migration[6.0]
  def change
    create_table :loves do |t|
      t.string :personality
      t.string :occupation
      t.string :favorite_food
      t.date :birthday
      t.text :background
      t.text :ideal_partner

      t.timestamps
    end
  end
end
