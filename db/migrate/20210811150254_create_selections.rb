class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.belongs_to :invoice, index: true
      t.belongs_to :product, index: true 
      t.timestamps
    end
  end
end
