class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :mobile_no, :integer
  end
end
