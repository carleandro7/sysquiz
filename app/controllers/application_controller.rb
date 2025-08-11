class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Redireciona user (admin) para dashboard após login
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      admin_root_path
    elsif resource.is_a?(Aluno)
      aluno_dashboard_path
    else
      super
    end
  end
end
