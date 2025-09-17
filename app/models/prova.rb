

class Prova < ApplicationRecord
  belongs_to :instituica
  has_many :serieano_provas, dependent: :destroy
  has_many :serieanos, through: :serieano_provas
  has_many :questaos, dependent: :destroy
  has_many :provalunos, dependent: :destroy
  has_many :alunos, through: :provalunos
  accepts_nested_attributes_for :questaos, allow_destroy: true, reject_if: :all_blank
end
