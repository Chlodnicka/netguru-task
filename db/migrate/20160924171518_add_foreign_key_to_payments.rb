class AddForeignKeyToPayments < ActiveRecord::Migration
  def change
    add_foreign_key :payments, :students
  end
end
