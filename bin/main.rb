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


spacing_cop(parsed_file)
indent_cop(parsed_file)