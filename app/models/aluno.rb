
class Aluno < ApplicationRecord
  belongs_to :instituica
  belongs_to :escola
  belongs_to :serieano

  has_secure_password

  before_validation :ensure_username_and_password

  validates :username, presence: true, uniqueness: true

  private

  def ensure_username_and_password
    if self.username.blank?
      base = "aluno"
      loop do
        self.username = "#{base}_#{SecureRandom.hex(3)}"
        break unless Aluno.exists?(username: self.username)
      end
    end
    if self.password_digest.blank? && self.password.blank?
      generated = SecureRandom.base58(8)
      self.password = generated
      self.password_confirmation = generated
    end
  end
end
