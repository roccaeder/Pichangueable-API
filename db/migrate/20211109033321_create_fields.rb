class CreateFields < ActiveRecord::Migration[6.1]
  def change
    create_table :fields do |t|
      t.string :field_type
      t.integer :capacity
      t.text :summary
      t.integer :price_hour
      t.datetime :published_at
      t.text :address
      t.references :user, null: false, foreign_key: true
      t.references :ubication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
