

class Prova < ApplicationRecord
  belongs_to :instituica
  belongs_to :escola, optional: true
  belongs_to :serieano, optional: true
  has_many :questaos, dependent: :destroy
  accepts_nested_attributes_for :questaos, allow_destroy: true, reject_if: :all_blank
end
