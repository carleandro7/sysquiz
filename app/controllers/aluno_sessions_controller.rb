class AlunoSessionsController < ApplicationController
	# Redireciona para login de aluno ou implementa lógica customizada
	def index
		redirect_to new_alunos_session_path
	end
end
