class Comentarios1
  def initialize
    @main_links_page = Nokogiri::HTML(open("http://comentarios1.folha.com.br/"))
  end

 # get the links from the main 'comentarios' page
  def get_main_links
    main_links = []
    parser = @main_links_page.css("ol a").select {|link| link[:href].include? 'http://comentarios1.folha.com.br/comentarios/'}
    parser.each {|url| main_links.push url[:href]}
    # return the links
    main_links
  end
end