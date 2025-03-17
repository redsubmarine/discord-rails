class Servers::ChannelsController < ApplicationController
  before_action :set_server
  before_action :set_server_channel, only: %i[ show edit update destroy ]

  # GET /servers/channels or /servers/channels.json
  def index
    @server_channels = Server::Channel.all
  end

  # GET /servers/channels/1 or /servers/channels/1.json
  def show
  end

  # GET /servers/channels/new
  def new
    @server_channel = Server::Channel.new
  end

  # GET /servers/channels/1/edit
  def edit
  end

  # POST /servers/channels or /servers/channels.json
  def create
    @server_channel = @server.channels.new(server_channel_params)

    if @server_channel.save
      redirect_to @server, notice: "Channel was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /servers/channels/1 or /servers/channels/1.json
  def update
    respond_to do |format|
      if @server_channel.update(server_channel_params)
        format.html { redirect_to @server_channel, notice: "Channel was successfully updated." }
        format.json { render :show, status: :ok, location: @server_channel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @server_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/channels/1 or /servers/channels/1.json
  def destroy
    @server_channel.destroy!

    respond_to do |format|
      format.html { redirect_to server_channels_path, status: :see_other, notice: "Channel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_server
    @server = Server.find(params.expect(:server_id))
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_server_channel
    @server_channel = Server::Channel.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def server_channel_params
    params.expect(server_channel: [ :name ])
  end
end
