
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

# Alunos fixos
Aluno.find_or_create_by!(username: "joao.silva", email: "joao.silva@sysquiz.com", nome: "João da Silva", escola: escola, instituica: instituica, serieano_id: serieano.id) do |a|
  a.password = "aluno123"
  a.password_confirmation = "aluno123"
end
Aluno.find_or_create_by!(username: "maria.souza", email: "maria.souza@sysquiz.com", nome: "Maria Souza", escola: escola, instituica: instituica, serieano_id: serieano.id) do |a|
  a.password = "aluno123"
  a.password_confirmation = "aluno123"
end

# === NOVOS DADOS DE SEED ===
# Cria 10 alunos
alunos = []
10.times do |i|
  alunos << Aluno.find_or_create_by!(username: "aluno#{i+1}", email: "aluno#{i+1}@sysquiz.com", nome: "Aluno #{i+1}", escola: escola, instituica: instituica, serieano_id: serieano.id) do |a|
    a.password = "aluno123"
    a.password_confirmation = "aluno123"
  end
end

# Cria 2 provas, cada uma com 10 questões
2.times do |p|
  prova = Prova.create!(
    titulo: "Prova Automática #{p+1}",
    descricao: "Prova gerada automaticamente número #{p+1}",
    instituica: instituica,
    data_inicio: 1.day.ago,
    data_fim: 7.days.from_now
  )
  SerieanoProva.create!(prova: prova, serieano: serieano)
  10.times do |q|
    Questao.create!(
      prova: prova,
      instituica: instituica,
      enuciado: "Questão #{q+1} da Prova #{p+1}",
      letra_a: "Alternativa A",
      letra_b: "Alternativa B",
      letra_c: "Alternativa C",
      letra_d: "Alternativa D",
      letra_e: "Alternativa E",
      alternativa_correta: %w[A B C D E].sample
    )
  end

  # Cada aluno responde a prova
  alunos.each do |aluno|
    provaluno = Provaluno.create!(prova: prova, aluno: aluno)
    prova.questaos.each do |questao|
      resposta = %w[a b c d e].sample
      Provaquestao.create!(prova: prova, aluno: aluno, questao: questao, resposta: resposta, embaralhada: %w[a b c d e].shuffle.join)
    end
  end
end

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

# Alunos fixos
Aluno.find_or_create_by!(username: "joao.silva", email: "joao.silva@sysquiz.com", nome: "João da Silva", escola: escola, instituica: instituica, serieano_id: serieano.id) do |a|
  a.password = "aluno123"
  a.password_confirmation = "aluno123"
end
Aluno.find_or_create_by!(username: "maria.souza", email: "maria.souza@sysquiz.com", nome: "Maria Souza", escola: escola, instituica: instituica, serieano_id: serieano.id) do |a|
  a.password = "aluno123"
  a.password_confirmation = "aluno123"
end

# === NOVOS DADOS DE SEED ===
# Cria 10 alunos
alunos = []
10.times do |i|
  alunos << Aluno.find_or_create_by!(username: "aluno#{i+1}", email: "aluno#{i+1}@sysquiz.com", nome: "Aluno #{i+1}", escola: escola, instituica: instituica, serieano_id: serieano.id) do |a|
    a.password = "aluno123"
    a.password_confirmation = "aluno123"
  end
end

# Provas
prova = Prova.find_or_create_by!(titulo: "Quiz de Ciências", descricao: "Perguntas sobre ciências gerais", instituica: instituica, data_inicio: 2.days.ago, data_fim: 5.days.from_now)

# Questões
Questao.find_or_create_by!(prova: prova, instituica: instituica, enuciado: "Qual é o planeta mais próximo do Sol?", letra_a: "Terra", letra_b: "Vênus", letra_c: "Marte", letra_d: "Mercúrio", letra_e: "Júpiter", alternativa_correta: "D")
Questao.find_or_create_by!(prova: prova, instituica: instituica, enuciado: "Qual é o maior órgão do corpo humano?", letra_a: "Coração", letra_b: "Fígado", letra_c: "Pele", letra_d: "Pulmão", letra_e: "Cérebro", alternativa_correta: "C")

# Prova exclusiva para João da Silva
joao = Aluno.find_by(username: "joao.silva")
if joao
  prova_joao = Prova.create!(
    titulo: "Prova Especial João da Silva!",
    descricao: "Prova exclusiva para o aluno João da Silva.",
    instituica: instituica,
    data_inicio: 1.day.ago,
    data_fim: 7.days.from_now
  )
  SerieanoProva.create!(prova: prova_joao, serieano: joao.serieano)
  # 10 questões para a prova do João
  10.times do |i|
    Questao.create!(
      prova: prova_joao,
      instituica: instituica,
      enuciado: "Questão especial #{i+1} para João da Silva!",
      letra_a: "Alternativa A",
      letra_b: "Alternativa B",
      letra_c: "Alternativa C",
      letra_d: "Alternativa D",
      letra_e: "Alternativa E",
      alternativa_correta: %w[A B C D E].sample
    )
  end
end
