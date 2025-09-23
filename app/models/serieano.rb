class Serieano < ApplicationRecord
  belongs_to :escola

  # Exibe "Escola - Série" para uso em selects
  def nome_com_escola
    [escola&.nome, nome].compact.join(" - ")
  end
end
