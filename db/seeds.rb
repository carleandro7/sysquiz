# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

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

# Alunos
Aluno.find_or_create_by!(nome: "João da Silva", escola: escola, instituica: instituica, serieano_id: serieano.id) do |a|
  a.password = "aluno123"
  a.password_confirmation = "aluno123"
end
Aluno.find_or_create_by!(nome: "Maria Souza", escola: escola, instituica: instituica, serieano_id: serieano.id) do |a|
  a.password = "aluno123"
  a.password_confirmation = "aluno123"
end

# Provas
prova = Prova.find_or_create_by!(titulo: "Quiz de Ciências", descricao: "Perguntas sobre ciências gerais", instituica: instituica, data_inicio: 2.days.ago, data_fim: 5.days.from_now)

# Questões
Questao.find_or_create_by!(prova: prova, instituica: instituica, enuciado: "Qual é o planeta mais próximo do Sol?", letra_a: "Terra", letra_b: "Vênus", letra_c: "Marte", letra_d: "Mercúrio", letra_e: "Júpiter", alternativa_correta: "D")
Questao.find_or_create_by!(prova: prova, instituica: instituica, enuciado: "Qual é o maior órgão do corpo humano?", letra_a: "Coração", letra_b: "Fígado", letra_c: "Pele", letra_d: "Pulmão", letra_e: "Cérebro", alternativa_correta: "C")
