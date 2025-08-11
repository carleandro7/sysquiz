class AddInicioToProvalunos < ActiveRecord::Migration[7.0]
  def change
    add_column :provalunos, :inicio, :datetime
    add_column :provalunos, :fim, :datetime
  end
end
