class AuditController < ApplicationController
  def index
    @audits = Audit.all
  end

  def show
    @audit = Audit.find(parems[:id])
  end
end
