class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :nome
      t.integer :tipo
      t.string :telefone
      t.integer :status
      t.references :instituica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
