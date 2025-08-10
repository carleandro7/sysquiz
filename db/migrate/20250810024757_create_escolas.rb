class CreateEscolas < ActiveRecord::Migration[8.0]
  def change
    create_table :escolas do |t|
      t.string :nome
      t.string :codinep
      t.references :instituica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
