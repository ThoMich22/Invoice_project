class ClientsController < ApplicationController

  def index
    @clients = Client.all 
  end

  def show
    @clients = Client.find(params[:id])
  end

  def new
    @clients = Client.new
  end

  def create 
    @clients = Client.create(clients_params)
    if @clients.save
      flash[:success] = "Création du nouveau client réussie "
      redirect_to @clients
    else
      flash[:error] = "Echec dans la création du nouveau client"
      redirect_to :new      
    end
  end

  def edit
    @clients = Client.find(params[:id])
  end

  def update
    @clients = Client.find(params[:id])
    if @clients.update(clients_params)
      flash[:success] = "Mise à jour client réussie "
      redirect_to @clients
    else
      flash[:error] = "Echec dans la mise à jours du client"
      render :edit    
    end
  end

  def destroy
    @clients = Client.find(params[:id])
    if @clients.destroy
      flash[:success] = "Produit supprimé"
      redirect_to clients_path
    else
      flash[:error] = "Echec dans la mise à jours du client"
      render :edit    
    end
  end

  private 

    def clients_params
      params.require(:client).permit(:company_name, :first_name, :last_name, :adress, :phone_number, :mail)
    end
    
end
