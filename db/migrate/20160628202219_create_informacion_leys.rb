class CreateInformacionLeys < ActiveRecord::Migration
  def change
    create_table :informacion_leys do |t|
      t.string :numero_ley
      t.datetime :fecha
      t.string :tipo
      t.text :explicacion_simplificada
      t.text :contenido_ley
      t.text :proyecto_ley

      t.timestamps null: false
    end
  end
end
