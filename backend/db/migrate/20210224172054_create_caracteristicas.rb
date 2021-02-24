class CreateCaracteristicas < ActiveRecord::Migration[5.1]
  def change
    create_table :caracteristicas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
