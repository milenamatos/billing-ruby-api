module Api
	module V1
    class StudentsController < ApplicationController  
			include Helper
			
      # GET /api/v1/students
      # Listar todos alunos
			def index
				list = Student.order('id ASC');
				result = list.map { |item| 						
					set_student(item) 
				}
				
				render json: { status: 'Sucesso', message:'Todos os alunos foram retornados.', data: result	 }, status: :ok
      end
      
      # GET /api/v1/students/:id
      # Listar por ID
			def show
				result = Student.find(params[:id])
				render json: {status: 'Sucesso', message: 'Aluno retornado.', data: set_student(result) }, status: :ok
      end
      
      # POST /api/v1/students
      # Criar um novo aluno
			def create
				student = Student.new(student_params)
				if student.save
					render json: { status: 'Sucesso', message: 'Salvo com sucesso.', data: student }, status: :created
				else
					render json: { status: 'Erro', message: 'Ocorreu um erro ao salvar.', data: student.errors },status: :unprocessable_entity
				end
      end
      
			private
			def student_params
				params.require(:student).permit(:name, :document, :birth_date, :telephone, :gender, :payment)
			end

		end
	end
end