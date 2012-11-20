class AuditController < ApplicationController
  helper_method :sort_column, :sort_order
  def index
    @audits = Audit.joins(:restaurant)
                   .order( sort_column + ' ' + sort_order )
                   .page(params[:page]).per(30)
  end

  def show
    @audit = Audit.find(params[:id])
  end

  def select
  end

  private

  def sort_column
    %w{name score date}.include?( params[:sort] ) ? params[:sort] : 'name'
  end

  def sort_order
    %w{asc, desc}.include?( params[:order] ) ? params[:order] : 'asc'
  end
end
