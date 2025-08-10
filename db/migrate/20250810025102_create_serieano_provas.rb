class CreateSerieanoProvas < ActiveRecord::Migration[8.0]
  def change
    create_table :serieano_provas do |t|
      t.references :serieano, null: false, foreign_key: true
      t.references :prova, null: false, foreign_key: true

      t.timestamps
    end
  end
end
