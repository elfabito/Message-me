class ChatroomController < ApplicationController
# before_action :set_message, only:[:index]

  def index
    
    @messages = Message.all
  end

  # private
  #
  #   def params_message
  #     params.require(:message).permit(:body,:user)
  #   end
  #
  #   def set_message
  #   @message = Message.find(params[:id])
  #   end
end
# <%= form_with(model: @message, class: "shadow-lg p-4 mb-3 bg-gray rounded", local:true, data: { turbo: false }, local:true ) do |f| %>
#     <div class="input-group justify-content-center mb-3">
#       <%= f.label :body, class:"col-2 col-form-label" %>
#       <div class="col-10">
#           <%= f.text :title, class:"form-control" %>
#       </div>
#
