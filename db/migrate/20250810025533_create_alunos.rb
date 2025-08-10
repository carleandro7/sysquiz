class CreateAlunos < ActiveRecord::Migration[8.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.references :instituica, null: false, foreign_key: true
      t.references :escola, null: false, foreign_key: true
      t.references :serieano, null: false, foreign_key: true

      t.timestamps
    end
  end
end
