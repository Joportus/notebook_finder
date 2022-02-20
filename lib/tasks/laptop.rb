class Laptop
  def initialize(name, cpu, ram, storage, screen, integrated_gpu, discrete_gpu, price, details_url, score, image_url, weight)
    @name = name
    @cpu = cpu
    @ram = ram
    @storage = storage
    @screen = screen
    @integrated_gpu = integrated_gpu
    @discrete_gpu = discrete_gpu
    @price = price
    @details_url = details_url
    @score = score
    @image_url = image_url
    @weight = weight
  end

  # defining getters
  attr_reader :name, :weight

  attr_reader :cpu, :ram, :storage, :screen, :integrated_gpu, :discrete_gpu, :price, :details_url, :score, :image_url


end