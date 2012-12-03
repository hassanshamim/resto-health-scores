class RestaurantController < ApplicationController
  helper_method :latest_audit_date, :audits_by_date

  def show
    @restaurant = Restaurant.find(params[:id])
    audits = @restaurant.audits.sort_by{ |audit| audit.date }
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column( 'date', 'Audited On' )
    data_table.new_column( 'number', 'Audit Score' )
    data = audits.map{ |audit| [ audit.date, audit.score ] }
    data_table.add_rows( data )
    date_formatter = GoogleVisualr::DateFormat.new( { formatType: 'medium' } )
    date_formatter.columns(1)
    data_table.format( date_formatter )

    opts = { width: 750, height:540, title: "#{@restaurant.name} Audits", legend: 'bottom' }
    @chart = GoogleVisualr::Interactive::LineChart.new( data_table, opts )
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

  def line_chart( resto )
    audits = @restaurant.audits.sort_by{ |audit| audit.date }
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column( 'date', 'Audited On' )
    data_table.new_column( 'number', 'Audit Score' )
    data = audits.map{ |audit| [ audit.date, audit.score ] }
    data_table.add_rows( data )
    date_formatter = GoogleVisualr::DateFormat.new( { formatType: 'medium' } )
    date_formatter.columns(1)
    data_table.format( date_formatter )

    opts = { width: 400, height:240, title: "#{resto.name} Audits", legend: 'bottom' }
    @chart = GoogleVisualr::Interactive::LineChart.new( data_table, opts )
  end

end
