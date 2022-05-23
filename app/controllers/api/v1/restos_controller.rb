module Api
    module V1
       class RestosController <  ApplicationController
         # GET /api/v1/airlines
        def index
            restos=Resto.all
           render json: RestoSerializer.new(restos, options).serialized_json
        end
      
        # GET /api/v1/airlines/:slug
        def show
            restos=Resto.find_by(slug:params[:slug])
           render json: RestoSerializer.new(restos, options).serialized_json
        end

        def create
            resto=Resto.new(resto_params)
            if resto.save
                render json:RestoSerializer.new(resto).serialized_json
            else
                render json:{error:resto.errors.messages},status:422
            end
        end

        def update
            resto=Resto.find_by(slug:params[:slug])
            if resto.update(resto_params)
                render json:RestoSerializer.new(resto,options).serialized_json
            else
                render json:{error:resto.errors.messages},status:422
            end
        end
        
        def destroy
            resto=Resto.find_by(slug:params[:slug])
            if resto.destroy
                head :no_content
            else
                render json:{error:resto.errors.messages},status:422
            end
        end

        private
        
        def resto_params
            params.require(:resto).permit(:name,:image_url)
        end

        def options
            @options ||={include: %i{reviews}}
        end

       end
    end
end