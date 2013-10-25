class ChangeDataTypeForPhoneNumbertoString < ActiveRecord::Migration
   def self.up
    change_table :messages do |t|
      t.change :phonenumber, :string
    end
  end
  def self.down
    change_table :messages do |t|
      t.change :phonenumber, :numeric
    end
  end
end
