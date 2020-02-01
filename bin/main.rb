#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/parser.rb'
require_relative '../lib/cops.rb'
require 'strscan'

include Cops

file_path = '/home/ae_co/Documents/Microverse/Ruby_Course/Capstone-Ruby-Linter/example'
kw = ['{']
b = Buffer.new(file_path)
parsed_file = Parser.new(b.content,kw)

indent_cop(parsed_file)

# def spacing_cop(parsed_file)
#   parsed_file.blocks.each do |x|
#     x[2].scan_until(/:/)
#     p x[2].matched
#   end
# end

# spacing_cop(parsed_file)