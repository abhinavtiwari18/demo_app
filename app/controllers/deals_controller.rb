class DealsController < ApplicationController
  before_action :check_user, only: [:confirm]

  def check_user
    unless current_user.present?
      redirect_to new_user_session_path
      return
    end
    if current_user.present? and current_user.is_admin?
      flash[:alert] = "Admin can't buy deals. Please login as customer"
      redirect_to root_path
    end
  end


  def create
    Deal.create(deal_params)
    flash[:notice] = 'Deal Added Successfully'
    redirect_to new_deal_path
  end

  def confirm
    @deal = Deal.includes(:orders).where(:id => params[:id]).first
    if @deal.orders.size >= @deal.quantity
      flash[:alert] = 'Deal is sold out'
      redirect_to root_path
      return
    elsif current_user.orders.pluck(:deal_id).include? @deal.id
      flash[:alert] = "Can't buy deal more than once"
      redirect_to root_path
      return
    end
    if current_user.orders.size >= 5
      discount_per = 5
    else
      discount_per = current_user.orders.size
    end
    @customer_price = @deal.discounted_price - ((@deal.discounted_price * discount_per).to_f/100)
  end

  def place_order
    Order.create(:deal_id => params[:id], :user_id => current_user.id)
    flash[:notice] = 'You order placed successfully'
    redirect_to root_path
  end

  protected
  def deal_params
    params.require(:deal).permit(:title, :description, :price, :discounted_price, :quantity, :publish_date, :picture)
  end
end
