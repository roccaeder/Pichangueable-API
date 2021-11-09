class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :phone
      t.integer :role
      t.timestamps
    end
  end
end
