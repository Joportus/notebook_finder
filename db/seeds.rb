require 'nokogiri'
require 'open-uri'
require_relative 'notebook.rb'

def number_of_pages
  url_base = 'https://www.solotodo.cl/notebooks?ordering=offer_price_usd&page='
  url = url_base + '1' + '&'
  doc = Nokogiri::HTML(URI.open(url))
  doc = doc.xpath('//body')
  pages = doc.css('ul.pagination li')
  pages = pages[7]
  page = pages.css('a/@aria-label')
  page = page.to_s.split(" ")
  page_number = page[1].to_i
  page_number
end


def scrape_computers_by_page(page_number, computers_arr)
  begin
    url_home = 'https://www.solotodo.cl'
    url_base = 'https://www.solotodo.cl/notebooks?ordering=offer_price_usd&page='
    url = url_base + page_number.to_s + '&'
    doc = Nokogiri::HTML(URI.open(url))
    doc = doc.xpath('//body')
    computers = doc.css('div.container-fluid
    div.row
    div.col-12
    div.row
    div#page-wrap
    div.d-flex
    div.flex-grow
    div.card
    div.card-block
    div.category-browse-result')
  rescue OpenURI::HTTPError => ex
    puts "Problema encontrando la página"

  end


  computers.each do |computer|

    name = computer.css('h3 a/text()')
    description = computer.css('div.description-container')
    specs = description.css('dl dd')
    cpu = specs[0]
    ram = specs[1]
    screen = specs[2]
    storage = specs[3]
    integrated_gpu = specs[4].css('ul li')[0]
    discrete_gpu = specs[4].css('ul li')[1]
    price = computer.css('div.d-flex div.price a/text()')
    details = computer.css('div.d-flex div.price a/@href')

    discrete_gpu = if discrete_gpu.nil?
      "None"
                   else
      discrete_gpu.text.to_s.strip
                   end

    name = name.to_s.strip unless name.nil?
    cpu = cpu.text.to_s.strip unless cpu.nil?
    ram = ram.text.to_s.strip unless ram.nil?
    screen = screen.text.to_s.strip unless screen.nil?
    storage = storage.text.to_s.strip unless storage.nil?
    integrated_gpu = integrated_gpu.text.to_s.strip unless integrated_gpu.nil?
    price = price.to_s.strip unless price.nil?
    price = price.tr('$', '').tr('.', '').to_i

    apps_score = 0

    gaming_score = 0

    mobility_score = 0

    details_url = 'no_url'

    unless details.nil?
      begin
        details = details.to_s.strip
        details_url = url_home + details
        ## getting computer details
        details_doc = Nokogiri::HTML(URI.open(details_url))
        details_doc = details_doc.xpath('//body')
        score = details_doc.css('div.container-fluid
      div.row
      div.col-12
      div#product-detail-grid
      div#product-detail-benchmarks
      div.content-card
      div.row
      div#benchmarks-container
      div.benchmark-container')

        apps_score = score.css('p.benchmark-score')[0].text.to_s.delete(' ').split('/')[0].to_s.to_i

        gaming_score = score.css('p.benchmark-score')[1].text.to_s.delete(' ').split('/')[0].to_s.to_i

        mobility_score = score.css('p.benchmark-score')[2].text.to_s.delete(' ').split('/')[0].to_s.to_i
      rescue OpenURI::HTTPError => ex
        puts "Detalle no encontrado"
      end

    end

    score = { "apps" => apps_score, "gaming" => gaming_score, "mobility" => mobility_score }

    computer_i = Notebook.new(name, cpu, ram, storage, screen, integrated_gpu, discrete_gpu, price, details_url, score)
    computers_arr << computer_i

  end

end

def scrape_computer_pages(num_of_pages)
  computers = []
  for i in 1..num_of_pages do
    scrape_computers_by_page(i, computers)
  end
  return computers
end

computers = scrape_computer_pages(number_of_pages)
Computer.find_each(&:destroy)
computers.each do |computer|
  Computer.create(
    name: computer.name,
    price: computer.price,
    cpu: computer.cpu,
    ram: computer.ram,
    storage: computer.storage,
    screen: computer.screen,
    integrated_gpu: computer.integrated_gpu,
    discrete_gpu: computer.discrete_gpu,
    details_url: computer.details_url,
    apps_score: computer.score['apps'],
    gaming_score: computer.score['gaming'],
    movility_score: computer.score['mobility']
  )

end





