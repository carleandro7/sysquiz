class Questao < ApplicationRecord
  belongs_to :prova
  belongs_to :instituica
  has_many :provaquestaos, dependent: :destroy
end
