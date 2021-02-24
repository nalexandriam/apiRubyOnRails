class Api::V1::EmpresasController < Api::V1::ApiController
 
 before_action :set_empresa, only: [:show, :update, :destroy]
 
 before_action :require_authorization!, only: [:show, :update, :destroy]
 
 # GET /api/v1/empresas
 
 def index
 
   @empresas = current_user.empresas
 
   render json: @empresas
 
 end
 
 # GET /api/v1/empresas/1
 
 def show
 
   render json: @empresa
 
 end
 
 # POST /api/v1/empresas
 
 def create
 
   @empresa = Empresa.new(empresa_params.merge(user: current_user))
 
   if @empresa.save
 
     render json: @empresa, status: :created
 
   else
 
     render json: @empresa.errors, status: :unprocessable_entity
 
   end
 
 end
 
 # PATCH/PUT /api/v1/empresas/1
 
 def update
 
   if @empresa.update(empresa_params)
 
     render json: @empresa
 
   else
 
     render json: @empresa.errors, status: :unprocessable_entity
 
   end
 
 end
 
 # DELETE /api/v1/empresas/1
 
 def destroy
 
   @empresa.destroy
 
 end
 
 private
 
   # Use callbacks to share common setup or constraints between actions.
 
   def set_empresa
 
     @empresa = Empresa.find(params[:id])
 
   end
 
   # Only allow a trusted parameter "white list" through.
 
   def empresa_params
 
     params.require(:empresa).permit(:logo, :descricao, :mapa, :login, :senha)
 
   end
 
   def require_authorization!
 
     unless current_user == @empresa.user
 
       render json: {}, status: :forbidden
 
     end
 
   end
 
end
