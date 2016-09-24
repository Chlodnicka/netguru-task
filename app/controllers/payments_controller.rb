class PaymentsController < ApplicationController

  def create
    if payment.save
      redirect_to payment_path(payment), notice: I18n.t('shared.created', resource: 'Student')
    else
      render :new
    end
  end

  def update
    if payment.save
      redirect_to payment_path(payment), notice: I18n.t('shared.updated', resource: 'Student')
    else
      render :edit
    end
  end

  def destroy
    payment.destroy
    redirect_to payments_path, notice: I18n.t('shared.deleted', resource: 'Student')
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_date, :amount, :status)
  end
end
