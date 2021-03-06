module Api
	module V1
    class InstitutionsController < ApplicationController  
			include Helper
			
      # GET /api/v1/institutions
      # Listar todas as instituićoes
			def index
				list = Institution.order('id ASC');
				result = list.map { |item| 						
					set_institution(item) 
				}
				
				render json: { status: 'Sucesso', message:'Todas as instituições foram retornadas.', data: result	 }, status: :ok
      end
      
      # GET /api/v1/institutions/:id
      # Listar por ID
			def show
				result = Institution.find(params[:id])
				render json: {status: 'Sucesso', message: 'Instituição retornada.', data: set_institution(result) }, status: :ok
      end
      
      # POST /api/v1/institutions
      # Criar uma nova instituição
			def create
				institution = Institution.new(institution_params)
				if institution.save
					render json: { status: 'Sucesso', message: 'Salvo com sucesso.', data: set_institution(institution) }, status: :created
				else
					render json: { status: 'Erro', message: 'Ocorreu um erro ao salvar.', data: institution.errors },status: :unprocessable_entity
				end
      end
      
			private
			def institution_params
				params.require(:institution).permit(:name, :institution_type, :document)
			end

		end
	end
end