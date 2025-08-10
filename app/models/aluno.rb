class Aluno < ApplicationRecord
  belongs_to :instituica
  belongs_to :escola
  belongs_to :serie
end
