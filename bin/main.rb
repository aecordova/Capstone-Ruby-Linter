#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/parser.rb'
require_relative '../lib/cops.rb'
require 'strscan'

include Cops

file_path = '../example'
kw = ['{']
b = Buffer.new(file_path)
parsed_file = Parser.new(b.content_s, kw)


line_format_cop(parsed_file)
spacing_cop(parsed_file)
indent_cop(parsed_file)


# check_lines_bet_blocks(parsed_file.blocks,'}')