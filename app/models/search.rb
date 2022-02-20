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
    name_count = {}
    computers.each do |c|
      name_count[c['name']] = 0
    end
    computers_result = []
    computers.each do |c|
      name_count[c['name']] += 1
      if name_count[c['name']] == 1
        computers_result << c
      end
    end
    computers_result
  end

  def lightest_computer(computers)
    lightest = computers[0]
    computers.each do |computer|
      if computer['movility_score'] > lightest['movility_score']
        lightest = computer
      end
    end
    lightest
  end

  def cheapest_computer(computers)
    cheapest = computers[0]
    computers.each do |computer|
      if computer['price'] < cheapest['price']
        cheapest = computer
      end
    end
    cheapest
  end
end
