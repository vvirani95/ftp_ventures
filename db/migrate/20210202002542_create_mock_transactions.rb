class CreateMockTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :mock_transactions do |t|
      t.string :transaction_description
      t.float :value
      t.string :transaction_type

      t.timestamps
    end
  end
end
