class CreateInfoleys < ActiveRecord::Migration
  def change
    create_table :infoleys do |t|
      t.string :numero_ley
      t.datetime :fecha
      t.string :tipo
      t.text :exp_simpl
      t.text :cont_ley
      t.text :proy_ley

      t.timestamps null: false
    end
  end
end
