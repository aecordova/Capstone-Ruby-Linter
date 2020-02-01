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

def spacing_cop(parsed_file)
  l = 0
  parsed_file.blocks.each do |x|
    line, s = x[0], x[2]
    spc_check_before(line, s, '\)')
    # spc_check_after(line, s, '\)')
    # spc_check_after(line, s, ',')
    # spc_check_after(line, s, ':')
  end
end

def spc_check_before(line, str, char)
  str.scan_until(Regexp.new(char))
  while str.matched?
    str.scan(/\s+/)
    log_error(2, line, char, str.pos) if str.matched != ' '
    str.scan_until(Regexp.new(char))
  end
end
