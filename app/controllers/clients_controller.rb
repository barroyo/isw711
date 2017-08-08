class ClientsController < ApplicationController
  before_action :validate_user

  def index
    # get all clients from the database
    all_clients = Client.all
    render(json: all_clients.to_json)
  end

  def create
    client = Client.new
    client.firstName = params[:firstName]
    client.lastName = params[:lastName]
    client.phone = params[:phone]

    if client.save
      render(json: client, status: 201, location: client)
    else
      render(json: client.errors, status: 422)
    end
  end

  def update
    client = Client.find(params[:id])
    byebug

    # # client.firstName = params[:firstName] ? params[:firstName] : client.firstName
    # # client.lastName = params[:lastName] ? params[:lastName] : client.lastName
    # # client.phone = params[:phone] ? params[:phone] : client.phone

    # if client.save
    if client.update(clients_params)
      render(json: client, status: 201)
    else
      render(json: client.errors, status: 422)
    end

  end

  def show
    client = Client.find(params[:id])

    render json: client, status: 200
  end


  private

    def clients_params
      params.require(:client).permit(:firstName, :lastName, :phone)
    end
end
