class CreateProvaquestaos < ActiveRecord::Migration[8.0]
  def change
    create_table :provaquestaos do |t|
      t.references :prova, null: false, foreign_key: true
      t.references :aluno, null: false, foreign_key: true
      t.references :questao, null: false, foreign_key: true
      t.string :resposta
      t.string :embaralhada

      t.timestamps
    end
  end
end
