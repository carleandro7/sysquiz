class CreateProvalunos < ActiveRecord::Migration[8.0]
  def change
    create_table :provalunos do |t|
      t.references :prova, null: false, foreign_key: true
      t.references :aluno, null: false, foreign_key: true

      t.timestamps
    end
  end
end
