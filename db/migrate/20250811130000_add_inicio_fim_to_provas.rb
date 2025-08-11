class AddInicioFimToProvas < ActiveRecord::Migration[7.0]
  def change
    add_column :provalunos, :tempo_limite, :integer, default: 120, null: false # minutos
  end
end
