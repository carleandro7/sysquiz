class AddUsernameAndPasswordToAlunos < ActiveRecord::Migration[7.1]
  def change
    add_column :alunos, :username, :string
    add_column :alunos, :password_digest, :string
    add_index :alunos, :username, unique: true
  end
end
