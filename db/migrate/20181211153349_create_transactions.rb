class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :currency
      t.float :quotation
      t.string :transaction_type

      t.timestamps
    end
  end
end
