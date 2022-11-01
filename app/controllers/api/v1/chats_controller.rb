module Api
    module V1
        class ChatsController < ApplicationController
            def index
                app = Application.where(token: params[:appToken]).take
                chats = Chat.where(app_id: app.id)
                
                render json: {status: 'SUCCESS', message:'Loaded chats', data:chats},status: :ok
            end

            def show
                app = Application.where(token: params[:appToken]).take
                chat = Chat.where(number:params[:id], app_id: app.id).take
                messages = Message.where(chat_id: chat.id)
                
                render json: {status: 'SUCCESS', message:'Loaded chat', data:{"chat":chat.slice(:number), "messages":messages }},status: :ok
            end

            def create
                maxNumber = Chat.all.length
                newNumber = maxNumber > 1 ? maxNumber + 1 : 1
                app = Application.where(token: params[:appToken]).take
                chat = Chat.new(
                    number: newNumber,
                    app_id: app.id ? app.id : null
                )
                if chat.save
                    render json: {status: 'SUCCESS', message:'Saved chat', data:chat.number},status: :ok
                else
                    render json: {status: 'ERROR', message:'chat not saved', data:chat.errors},status: :unprocessable_entity
                end
            end

            def destroy
                app = Application.where(token: params[:appToken]).take
                chat = Chat.where(number:params[:id], app_id: app.id).take
                render json: {status: 'SUCCESS', message:'Deleted chat', data:chat},status: :ok
            end
        end
    end
end
