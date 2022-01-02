class SelectionsController < ApplicationController
  def index
    # @selections = Selection.all 
  end

  def new
    # @selection = Selection.new
  end


  def create
    # @selection = Selection.create(selection_params)
    # if @selection.save
    #   flash[:success] = "Mise à jour client réussie "
    #   redirect_to selections_path
    # else
    #   flash[:error] = "Echec dans la mise à jours du client"
    #   render :new    
    # end
  end

  

  def destroy
    # @selection= Selection.find(params[:id])
    # if @selection.destroy
    #   flash[:success] = "Produit supprimé"
    #   redirect_to selections_path
    # else
    #   flash[:error] = "Echec dans la mise à jours du client"
    #   render :edit    
    # end
  end

  private 

    # def selection_params
    #   params.require(:selection).permit(:invoice_id, :product_id)
    # end
end
