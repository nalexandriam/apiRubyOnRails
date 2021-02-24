class CreateEmpresas < ActiveRecord::Migration[5.1]
  def change
    create_table :empresas do |t|
      t.text :logo
      t.string :descricao
      t.string :mapa
      t.string :login
      t.string :senha
      t.references :user, foreign_key: true
      t.references :caracteristica, foreign_key: true

      t.timestamps
    end
  end
end
