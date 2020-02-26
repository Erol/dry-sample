class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user
      t.text :description
      t.integer :amount
      t.string :digest

      t.timestamps
    end

    add_foreign_key :transactions, :users
    add_index :transactions, :digest, unique: true
  end
end
