class BalancesController < ApplicationController
  #before_action :set_balance, only: [:destroy]

  def destroy
    @balance = Balance.find(params[:id])
    @balance.destroy
    respond_to do |format|
      format.html { redirect_to settle_events_path }
      format.json { head :no_content }
    end
  end

  private
  def set_balance
    @balance = Balance.find(params[:id])
  end
end