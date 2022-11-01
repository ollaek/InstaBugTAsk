module Api
    module V1
        class ApplicationsController < ApplicationController
            def index
                apps = Application.all
                render json: {status: 'SUCCESS', message:'Loaded apps', data:apps},status: :ok
            end

            def show
                app = Application.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded app', data:app},status: :ok
            end

            def create
                app = Application.new(
                    token:SecureRandom.hex(8),
                    name:params[:name]
                )
                if app.save
                    render json: {status: 'SUCCESS', message:'Saved app', data:app},status: :ok
                else
                    render json: {status: 'ERROR', message:'App not saved', data:app.errors},status: :unprocessable_entity
                end
            end

            def update
                app = Application.find(params[:id])
                if app.update_attributes(name: params[:name])
                    render json: {status: 'SUCCESS', message:'Updated app', data:app},status: :ok
                  else
                    render json: {status: 'ERROR', message:'App not updated', data:app.errors},status: :unprocessable_entity
                  end
            end

            def destroy
                app = Application.find(params[:id])
                app.destroy
                render json: {status: 'SUCCESS', message:'Deleted app', data:app},status: :ok
            end
        end
    end
end
