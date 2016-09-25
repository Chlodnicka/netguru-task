class PaymentsController < ApplicationController

  def index
    @students = Student.all
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_date, :amount, :status)
  end
end
