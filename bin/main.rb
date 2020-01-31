#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/parser.rb'
require 'strscan'

file_path = '../example.rb'

b = Buffer.new(file_path)


keyw = ['class','def']

def build_blocks (buffer,keywords)
  blocks = Hash.new
  level = 0
  id = 1
  l= ''
  keywords.each do |k|
    buffer.line_reset
    until buffer.eof?
      l= buffer.line_get
      s = StringScanner.new(l)
      if s.exist?(Regexp.new(k))
        p 'found a '+ k
        # blocks[:id] =  id
        # id += 1
        blocks[:type] = k
        blocks[:level] = level
        # blocks[:s_line] = buffer.curr_line
        # blocks[:content] = l
        level += 1
      end  
      if s.exist?(/end/)
          p 'end'
          level-=1
      end
      puts blocks 
      buffer.line_next
    end
  end
end

build_blocks(b,keyw)