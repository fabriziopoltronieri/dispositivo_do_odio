#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

require './parser_comentarios1'

comentarios_main = Comentarios1.new
main_links = comentarios_main.get_main_links

main_links.each do |x|
	puts x
end