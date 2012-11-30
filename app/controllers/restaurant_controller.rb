class RestaurantController < ApplicationController
  helper_method :latest_audit_date, :audits_by_date

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.order( 'name ASC').page(params[:page])
  end

  def audits_by_date( resto )
    resto.audits.sort_by{ |audit| audit.date }.reverse
  end

  def latest_audit_date( resto )
    latest = audits_by_date( resto ).first
    latest.date.to_formatted_s( :display )
  end

end
