#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

require './parser_comentarios1'
require './parser_comentarios_proper_page'

# get the links from the 'lista de comentários' page
comentarios_main = Comentarios1.new
main_links = comentarios_main.get_main_links

# get the proper comments
proper_comments = ParserComentariosProperPage.new
main_links.each do |x|
  proper_comments.get_proper_comments(x)
end