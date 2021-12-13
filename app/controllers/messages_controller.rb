class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # POST /rooms or /rooms.json
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_back fallback_location: room_path(@room), notice: "Message was successfully sent." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.permit(:room_id, :user_id, :body)
    end
end
