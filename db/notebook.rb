class Notebook
  def initialize(name, cpu, ram, storage, screen, integrated_gpu, discrete_gpu, price, details_url, score, image_url)
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
  end

  #defining getters
  def name
    @name
  end

  def cpu
    @cpu
  end

  def ram
    @ram
  end

  def storage
    @storage
  end

  def screen
    @screen
  end

  def integrated_gpu
    @integrated_gpu
  end

  def discrete_gpu
    @discrete_gpu
  end

  def price
    @price
  end

  def details_url
    @details_url
  end

  def score
    @score
  end

  def image_url
    @image_url
  end


end