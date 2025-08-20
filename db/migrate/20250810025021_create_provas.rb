class CreateProvas < ActiveRecord::Migration[8.0]
  def change
    create_table :provas do |t|
    t.string :titulo
    t.text :descrica
    t.datetime :data_inicio
    t.datetime :data_fim
    t.references :instituica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
