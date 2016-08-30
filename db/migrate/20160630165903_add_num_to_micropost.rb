class AddNumToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :num, :string
  end
end
