class Provaquestao < ApplicationRecord
  belongs_to :prova
  belongs_to :aluno
  belongs_to :questao
end
