class AddPaisToInfoley < ActiveRecord::Migration
  def change
    add_column :infoleys, :pais, :string
  end
end
