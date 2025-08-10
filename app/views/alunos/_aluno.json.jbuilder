json.extract! aluno, :id, :nome, :instituica_id, :escola_id, :serie_id, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
