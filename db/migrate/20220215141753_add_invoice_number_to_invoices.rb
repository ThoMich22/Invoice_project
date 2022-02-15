class AddInvoiceNumberToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :invoice_number, :integer
  end
end
