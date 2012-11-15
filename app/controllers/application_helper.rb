module ApplicationHelper
  def sortable( column )
    order = column == sort_column && sort_order == "desc" ? "asc" : "desc"
    link_to( column.titleize, :sort => column, :order => order )
  end
end
