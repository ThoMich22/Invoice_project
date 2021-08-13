class InvoicesController < ApplicationController
  def index
    @invoice = Invoice.all 
  end

  def show
    @invoice = Invoice.find(params[:id])
    @clients = Client.all
  end

  def new
    @invoice = Invoice.new
  end

  def create 
    @invoice = Invoice.create(invoice_params)
    if @invoice.save
      flash[:success] = "Création du nouveau client réussie "
      redirect_to invoices_path
    else
      flash[:error] = "Echec dans la création du nouveau client"
      redirect_to @invoice     
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoice_params)
      flash[:success] = "Mise à jour client réussie "
      redirect_to invoices_path
    else
      flash[:error] = "Echec dans la mise à jours du client"
      render :edit    
    end
  end

  def destroy
    @invoice= Invoice.find(params[:id])
    if @invoice.destroy
      flash[:success] = "Produit supprimé"
      redirect_to invoices_path
    else
      flash[:error] = "Echec dans la mise à jours du client"
      render :edit    
    end
  end

  private 

    def invoice_params
      params.require(:invoice).permit(:date, :statue, :client_id)
    end
  
end
