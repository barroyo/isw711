class ClientsController < ApplicationController

  def index
    # get all clients from the database
    all_clients = Client.all
    render(json: all_clients.to_json)
  end

  def create
    byebug
    client = Client.new

    client.firstName = params[:firstName]
    client.lastName = params[:lastName]
    client.phone = params[:phone]

    client.save
  end
end
