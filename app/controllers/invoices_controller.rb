class InvoicesController < ApplicationController
  
  INVOICES_PER_PAGE = 4
  
  def index
    
    @invoices = Invoice.where(:user_id => current_user.id).count
    
    @page = params.fetch(:page, 0).to_i
    @invoice = Invoice.where(:user_id => current_user.id).offset(@page * INVOICES_PER_PAGE).limit(INVOICES_PER_PAGE).order(id: :desc)
    
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
    @statut = ['brouillon', 'en cours', 'payée']

    @invoice = Invoice.new

    
    @invoices = Invoice.where(:user_id => current_user.id)
    if @invoices.empty? == true 
      @invoice_number = '1'
    else
      @invoice_number = Invoice.where(:user_id => current_user.id).map(&:invoice_number).max + 1
    end
    # @products = Product.all 
    # @products.each { @invoice.selections.build }
    # @invoice.selections.build.build_product
    
  end

  def create 
    @client = Client.where(:user_id => current_user.id)
    @invoice = Invoice.create(invoice_params)
    @invoice.user_id = current_user.id
    
    @invoices = Invoice.where(:user_id => current_user.id)
    if @invoices.empty? == true
      @invoice.invoice_number = '1'
    else
      @invoice.invoice_number = Invoice.where(:user_id => current_user.id).map(&:invoice_number).max + 1
    end 

    if @invoice.save
      flash[:success] = "Création du devis réussie "
      redirect_to invoices_path
    else
      flash[:error] = "Echec dans la création du devis"
      redirect_to @invoice     
    end

  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoice_params)
      flash[:success] = "Devis modifié"
      redirect_to invoices_path
    else
      flash[:error] = "Echec dans la modification du devis"
      redirect_to @invoice   
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    if @invoice.destroy
      flash[:success] = "Devis supprimé"
      redirect_to invoices_path
    else
      flash[:error] = "Echec dans la supression du devis"
      render :edit    
    end
  end

  private 

    def invoice_params
      params.require(:invoice).permit(:date, :statue, :client_id, :user_id, selections_attributes: [:invoice_id, :_destroy, :id, product_attributes: [:title, :description, :price, :_destroy, :id]])
    end

end
