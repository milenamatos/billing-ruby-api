class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private
  def record_not_found(error)
    render json: { status: 'Não encontrado', message:'Nenhum resultado foi encontrado.', data: error	 }, status: :not_found
  end
end
