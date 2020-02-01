#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/parser.rb'
require 'strscan'

file_path = '/home/ae_co/Documents/Microverse/Ruby_Course/Capstone-Ruby-Linter/example'
kw = ['{']
b = Buffer.new(file_path)
parsed_file = Parser.new(b.content,kw)



indent_cop(parsed_file)