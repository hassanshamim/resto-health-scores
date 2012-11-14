class AuditController < ApplicationController
  def index
    sort_order = {'name' => 'name ASC', 'score' => 'score DESC', 'date' => 'date DESC' }
    sort = sort_order[ params.fetch(:sort){'name'} ]
    @audits = Audit.all :order => sort
  end

  def show
    @audit = Audit.find(params[:id])
  end

  def select
  end
end
