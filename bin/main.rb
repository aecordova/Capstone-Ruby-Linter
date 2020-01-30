#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/parser.rb'

file_path = '../example.rb'

buff = Buffer.new(file_path)

p buff

