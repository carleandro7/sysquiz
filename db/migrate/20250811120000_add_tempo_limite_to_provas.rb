class AddTempoLimiteToProvas < ActiveRecord::Migration[7.0]
  def change
    add_column :provas, :tempo_limite, :integer, default: 120, null: false # minutos
  end
end
