class CreateQuestaos < ActiveRecord::Migration[8.0]
  def change
    create_table :questaos do |t|
      t.text :enuciado
      t.text :letra_a
      t.text :letra_b
      t.text :letra_c
      t.text :letra_d
      t.text :letra_e
      t.string :alternativa_correta
      t.references :prova, null: false, foreign_key: true
      t.references :instituica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
