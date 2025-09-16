
# ...existing code...

# Instituições
instituica = Instituica.find_or_create_by!(nome: "Instituto Central")

# Escolas
escola = Escola.find_or_create_by!(nome: "Escola Alpha", codinep: "12345678", instituica: instituica)

# Séries/Ano
serieano = Serieano.find_or_create_by!(nome: "9º Ano", escola: escola)

# Usuário admin
User.find_or_create_by!(email: "admin@sysquiz.com") do |u|
  u.nome = "Administrador"
  u.password = "admin123"
  u.password_confirmation = "admin123"
  u.instituica = instituica
end

end
