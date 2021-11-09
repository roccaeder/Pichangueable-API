class CreateUbications < ActiveRecord::Migration[6.1]
  def change
    create_table :ubications do |t|
      t.string :district
      t.string :departament

      t.timestamps
    end
  end
end
