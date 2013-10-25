class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :countrycode
      t.integer :phonenumber
      t.text :message

      t.timestamps
    end
  end
end
