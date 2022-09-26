class ProductionsController < ApplicationController
    def index
        render json: Production.all, except:[:updated_at,:created_at],methods: :my_crew, status: :ok 
        #
    end

    def show
        production = Production.find_by(id:params[:id])

        if production
         render json: production,except:[:updated_at,:created_at],include: :crew_members, status: :ok
        else
            render json: {error: "No production found with id: #{params[:id]}"}, status: :not_found
        end
    end

    def create
        new_production = Production.create(production_params)
        byebug
       render json: new_production, except:[:updated_at,:created_at], status: :created
    end

    def update
        production=Production.find_by(id:params[:id])

        if production
            production.update(production_params)
            render json: production, status: :accepted
        else
            render json: {error: "No production with id: #{params[:id]}"}, status: :not_found
        end
    end

    def destroy
       production= Production.find_by(id:params[:id])

       if production 
            production.destroy
            head :no_content
        else
            render json: {error:"No production with id: #{params[:id]} found"}, status: :not_found
        end
    end

    private
    def production_params
        params.permit :title,:genre,:budget,:image,:director,:ongoing
    end
end
