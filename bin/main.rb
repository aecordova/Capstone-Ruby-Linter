#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/parser.rb'
require_relative '../lib/cops.rb'
require 'strscan'

include Cops

file_path = '../example'
kw = ['{']
b = Buffer.new(file_path)
parsed_file = Parser.new(b.content,kw)


# line_format_cop(parsed_file)
# spacing_cop(parsed_file)
# indent_cop(parsed_file)

def check_lines_bet_blocks(blocks)
  blocks.each_with_index do |b,i|
    next unless b[2].exist?(/}/)
    n = i
    spct = 0
     if b[2].matched?
      p blocks[n+1][2].string==""

     end
  end
end

check_lines_bet_blocks(parsed_file.blocks)