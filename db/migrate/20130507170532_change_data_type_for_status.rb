class ChangeDataTypeForStatus < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.change :status, :string
    end
  end
  def self.down
    change_table :books do |t|
      t.change :status, :string
    end
  end
end
