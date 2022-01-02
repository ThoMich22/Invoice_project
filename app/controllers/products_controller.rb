class ProductsController < ApplicationController
  def index
    # @product = Product.all 
  end

  def show
    # @product = Product.find(params[:id])
  end

  def new
    # @product = Product.new
  end

  def create 
    # @product = Product.create(product_params)
    # if @product.save
    #   flash[:success] = "Création du nouveau client réussie "
    #   redirect_to products_path
    # else
    #   flash[:error] = "Echec dans la création du nouveau client"
    #   redirect_to @product     
    # end
  end

  def edit
    # @product = Product.find(params[:id])
  end

  def update
    # @product = Product.find(params[:id])
    # if @product.update(product_params)
    #   flash[:success] = "Mise à jour client réussie "
    #   redirect_to products_path
    # else
    #   flash[:error] = "Echec dans la mise à jours du client"
    #   render :edit    
    # end
  end

  def destroy
    # @product= Product.find(params[:id])
    # if @product.destroy
    #   flash[:success] = "Produit supprimé"
    #   redirect_to products_path
    # else
    #   flash[:error] = "Echec dans la mise à jours du client"
    #   render :edit    
    # end
  end

  private 

    # def product_params
    #   params.require(:product).permit(:title, :description, :price)
    # end
end
