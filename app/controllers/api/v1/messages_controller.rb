module Api
    module V1
        class MessagesController < ApplicationController
            def index
                app = Application.where(token: params[:appToken]).take
                chat = Chat.where(number: params[:chatNumber], app_id: app.id).take
                messages = Message.where(chat_id: chat.id);
                
                render json: {status: 'SUCCESS', message:'Loaded messages', data:messages},status: :ok
            end

            def show
                app = Application.where(token: params[:appToken]).take
                chat = Chat.where(number: params[:chatNumber], app_id: app.id).take
                message = Message.where(number:params[:id], chat_id: chat.id).take

                render json: {status: 'SUCCESS', message:'Loaded message', data:message},status: :ok
            end

            def create
                maxNumber = Message.all.length
                newNumber = maxNumber > 1 ? maxNumber + 1 : 1

                app = Application.where(token: params[:appToken]).take
                chat = Chat.where(number: params[:chatNumber], app_id: app.id).take

                message = Message.new(
                    number: newNumber,
                    message: params[:message],
                    chat_id: chat.id
                )
                if message.save
                    render json: {status: 'SUCCESS', message:'Saved message', data:message.number},status: :ok
                else
                    render json: {status: 'ERROR', message:'message not saved', data:message.errors},status: :unprocessable_entity
                end
            end

            def destroy
                app = Application.where(token: params[:appToken]).take
                chat = Chat.where(number: params[:chatNumber], app_id: app.id).take
                message = Chat.where(number:params[:id], chat_id: chat.id).take

                render json: {status: 'SUCCESS', message:'Deleted message', data:message},status: :ok
            end

            def search
                results = Message.search(params[:query])

                messages = results.map do |r|
                    r.merge(r.delete('_source')).merge('id': r.delete('_id'))
                end
                render json: {status: 'SUCCESS', message:'Loaded messages', data:messages.response["hits"]["hits"]},status: :ok
            end
        end
    end
end
