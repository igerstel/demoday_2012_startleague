class SplitNameInTwo < ActiveRecord::Migration
  def up
  	add_column :users, :last_name, :string
  	rename_column :users, :name, :first_name
  end

  def down
  end
end
