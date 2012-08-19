class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :password_confirmation
      t.string :name
      t.string :business_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :website
      t.string :phone
      t.text :about
      t.string :business
      t.string :tag
      t.boolean :favorite

      t.timestamps
    end
  end
end
