class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :payment_date
      t.string :status
      t.integer :student_id

      t.timestamps
    end
  end
end
