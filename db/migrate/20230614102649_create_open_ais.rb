class CreateOpenAis < ActiveRecord::Migration[6.0]
  def change
    create_table :open_ais do |t|

      t.timestamps
    end
  end
end
