class Search < ApplicationRecord
  def search_computers
    computers = Computer.all

    computers = computers.where(["price <= ?", budget]) if budget.present?
    case use_case
    when "gaming_score"
      computers = computers.order("gaming_score DESC")
    when "apps_score"
      computers = computers.order("apps_score DESC")
    end
    computers = computers.first(5)
    computers
  end
end
