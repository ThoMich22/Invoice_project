class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.datetime :date
      t.string :statue
      t.belongs_to :client, index: true
      t.timestamps
    end
  end
end
