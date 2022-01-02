class InvoicesController < ApplicationController
  def index
    @invoice = Invoice.all
    @invoice = Invoice.order(created_at: :asc)
  end

  def show
    @invoice = Invoice.find(params[:id])
    @clients = Client.all
    @selection = @invoice.selections

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Devis: #{@invoice.id}", template: "invoices/test_invoice.html.erb", layout: "pdf"  # Excluding ".pdf" extension.
      end
    end
  end

  def new
    @invoice = Invoice.new
    # @products = Product.all 
    # @products.each { @invoice.selections.build }
    # @invoice.selections.build.build_product
    
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
      flash[:success] = "Invoice modifié"
      redirect_to invoices_path
    else
      flash[:error] = "Echec dans la modification du devis"
      redirect_to @invoice   
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
      params.require(:invoice).permit(:date, :statue, :client_id, selections_attributes: [:invoice_id, :_destroy, :id, product_attributes: [:title, :description, :price, :id]])
    end
end
