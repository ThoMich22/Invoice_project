class ClientsController < ApplicationController

  def index
    @clients = Client.all 
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @clients = Client.new
  end

  def create 
    @client = Client.create(client_params)
    if @Client.save
      flash[:success] = "Création du nouveau client réussie "
      redirect_to @client
    else
      flash[:error] = "Echec dans la création du nouveau client"
      redirect_to :new      
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.update(client_params)
    if @Client.save
      flash[:success] = "Mise à jour client réussie "
      redirect_to @client
    else
      flash[:error] = "Echec dans la mise à jours du client"
      render :edit    
    end
  end

  def destroy
    Section.find(params[:id]).destroy 
  end

  private 

    def client_params
      params.require(:client).permit(:company_name, :first_name, :last_name, :adress, :phone_number, :mail)
    end
    
end
