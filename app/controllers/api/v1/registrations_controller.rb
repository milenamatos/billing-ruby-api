module Api
	module V1
    class RegistrationsController < ApplicationController  
			include Helper
			
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

			# POST /api/v1/registrations
      # Criar uma nova matrícula e suas respectivas faturas
			def create
				registration = Registration.new(registration_params)
				if registration.save
					current_date = DateTime.now
					current_day = current_date.strftime("%d").to_i
					current_month = current_date.strftime("%m").to_i

					first_bill_date = current_date.change(day: registration.due_date)
					bill_date = (registration.due_date > current_day) ? first_bill_date : first_bill_date.next_month
					
					price = registration.total_price / registration.bill_quantity

					for i in 1..registration.bill_quantity do
						bill = Bill.new({registration_id: registration.id, due_date: bill_date.strftime("%Y/%m/%d"), price: price})
						if not bill.save
							return render json: { status: 'Erro', message: 'Ocorreu um erro ao salvar as faturas.', data: bill.errors },status: :unprocessable_entity
						end
						bill_date = bill_date.next_month
					end 

					render json: { status: 'Sucesso', message: 'Matrícula e faturas criadas com sucesso.', data: set_registration(registration) }, status: :created
				else
					render json: { status: 'Erro', message: 'Ocorreu um erro ao salvar a matrícula.', data: registration.errors },status: :unprocessable_entity
				end
			end			

			def set_registration(item)
				return {
					id: item.id,
					valor_total: item.total_price,
					quantidade_faturas: item.bill_quantity,
					dia_vencimento: item.due_date,
					nome_curso: item.course_name,
					instituicao: set_institution(item.institution),
					aluno: set_student(item.student),
					lista_faturas: item.bill.map { |bill| set_bill(bill) },
					dt_criacao: item.created_at.strftime("%F %T")
				}
			end

			private
			def registration_params
				params.require(:registration).permit(:total_price, :bill_quantity, :due_date, :course_name, :institution_id, :student_id)
			end
		end
	end
end