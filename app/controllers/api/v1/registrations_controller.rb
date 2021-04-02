module Api
	module V1
    class RegistrationsController < ApplicationController  
      
      # GET /api/v1/registrations
      # Listar todas as matrículas
			def index
				list = Registration.order('id ASC')
				result = list.map { |item| 										
					set_registration(item) 
				}
				
				render json: { status: 'Sucesso', message:'Todas as matrículas foram retornadas.', data: result	 }, status: :ok
      end
      
      # GET /api/v1/registrations/:id
      # Listar por ID
			def show
				result = Registration.find(params[:id])
				render json: {status: 'Sucesso', message: 'Matrícula retornada.', data: set_registration(result) }, status: :ok
      end

			def set_registration(item)
				return {
					id: item.id,
					valor_total: item.total_price,
					qtd_faturas: item.bill_quantity,
					dia_vencimento: item.due_date,
					nome_curso: item.course_name,
					instituicao_id: item.institution_id,
					aluno_id: item.student_id,
					dt_criacao: item.created_at.strftime("%F %T")
				}
			end
		end
	end
end