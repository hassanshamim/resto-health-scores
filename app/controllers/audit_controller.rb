class AuditController < ApplicationController
  def index
    @audits = Audit.all
  end

  def show
    @audit = Audit.find(params[:id])
  end

  def select
  end
end
