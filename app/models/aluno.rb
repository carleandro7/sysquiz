
class Aluno < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:username]
  belongs_to :instituica
  belongs_to :escola
  belongs_to :serieano

  has_many :provalunos
  has_many :provas, through: :provalunos

  validates :username, presence: true, uniqueness: true
end
