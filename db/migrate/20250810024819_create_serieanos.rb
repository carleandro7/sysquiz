class CreateSerieanos < ActiveRecord::Migration[8.0]
  def change
    create_table :serieanos do |t|
      t.string :nome
      t.references :escola, null: false, foreign_key: true

      t.timestamps
    end
  end
end
