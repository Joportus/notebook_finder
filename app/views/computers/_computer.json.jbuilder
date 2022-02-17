json.extract! computer, :id, :name, :cpu, :ram, :storage, :screen, :integrated_gpu, :discrete_gpu, :details_url, :apps_score, :gaming_score, :movility_score, :price, :created_at, :updated_at
json.url computer_url(computer, format: :json)
