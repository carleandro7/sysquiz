

class Aluno < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :timeoutable,
         :recoverable, :rememberable, :validatable, authentication_keys: [ :username ]
  belongs_to :instituica
  belongs_to :escola
  belongs_to :serieano

  has_many :provalunos, dependent: :destroy
  has_many :provas, through: :provalunos
  has_many :provaquestaos, dependent: :destroy

  validates :username, presence: true, uniqueness: true
end
