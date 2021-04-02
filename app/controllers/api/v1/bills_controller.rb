module Api
	module V1
    class BillsController < ApplicationController  
      
      # GET /api/v1/bills
      # Listar todas as faturas
			def index
				list = Bill.order('id ASC');
				result = list.map { |item| 						
					set_bill(item) 
				}
				
				render json: { status: 'Sucesso', message:'Todas as faturas foram retornadas.', data: result }, status: :ok
      end
      
      # GET /api/v1/bills/:registration_id
      # Listar por ID da matrícula
			def show
        list = Bill.where(registration_id: params[:id])
        result = list.map { |item| 						
					set_bill(item) 
        }
        
				render json: {status: 'Sucesso', message: 'Retornadas as faturas filtradas por matrícula.', data: result }, status: :ok
      end

			def set_bill(item)
				return {
					id: item.id,
					valor: item.price,
					data_vencimento: item.due_date,
          status: Bill.statuses[item.status],
					matricula_id: item.registration_id,
					dt_criacao: item.created_at.strftime("%F %T")
				}
			end
		end
	end
end