#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/buffer.rb'
require_relative '../lib/cops.rb'
# rubocop: disable Style/MixinUsage
include Cops

file_path = ARGV.shift
k_open = '{'
k_close = '}'
b = Buffer.new(file_path)

line_format_cop(b.content_s)
spacing_cop(b.content_s)
indent_cop(b.content_s, k_open, k_close)
# rubocop: enable Style/MixinUsage
