# frozen_string_literal: true

require 'strscan'

# This module contains all the revisions to be made to CSS files
module Cops
  # rubocop: disable Metrics/AbcSize
  def indent_cop(parsed_file)
    parsed_file.blocks.each do |x|
      x[2].reset
      x[2].scan(/\s+/)
      sp = if x[2].matched?
             x[2].matched.length
           else
             0
           end
      log_error(1, x[0]) unless sp == x[1] * 2
    end
  end

  def spacing_cop(parsed_file)
    parsed_file.blocks.each do |x|
      line = x[0]
      s = x[2]
      spc_check_before(line, s, '{')
      spc_check_before(line, s, '\(')
      spc_check_after(line, s, '\)')
      spc_check_after(line, s, ',')
      spc_check_after(line, s, ':')
    end
  end

  def line_format_cop(parsed_file)
    parsed_file.blocks.each do |x|
      line = x[0]
      s = x[2]
      check_ret_after(line, s, '{')
      check_ret_after(line, s, '}')
      check_ret_after(line, s, ';')
    end
    check_lines_bet_blocks(parsed_file.blocks, '}')
  end

  def spc_check_before(line, str, char)
    str.reset
    s = str.scan_until(Regexp.new(char))
    while str.matched?
      s = StringScanner.new(s.reverse)
      s.skip(Regexp.new(char))
      s.scan(/\s+/)
      log_error(3, line, char, s.string.length - s.pos) if s.matched != ' '
      s = str.scan_until(Regexp.new(char))
    end
  end

  def spc_check_after(line, str, char)
    str.reset
    str.scan_until(Regexp.new(char))
    while str.matched?
      str.scan(/\s+/)
      log_error(2, line, char, str.pos) if str.matched != ' '
      str.scan_until(Regexp.new(char))
    end
  end

  def check_ret_after(line, str, char)
    str.reset
    str.scan_until(Regexp.new(char))
    while str.matched?
      log_error(4, line, char, str.pos) unless str.eos?
      str.scan_until(Regexp.new(char))
    end
  end

  # rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/MethodLength
  def check_lines_bet_blocks(block, char)
    found = false
    counter = 0
    0.upto(block.length - 1) do |i|
      block[i][2].reset
      if found && block[i][2].string == ''
        counter += 1
        log_error(5, i + 1, char) if counter > 1
      elsif found && block[i][2].string != ''
        log_error(5, i + 1, char) if counter.zero? && !block[i][2].exist?(/}/)
      else
        found = false
      end
      if block[i][2].exist?(/}/)
        found = true
        counter = 0
      end
    end
  end

  def log_error(type, line, char = nil, pos = nil)
    err_string = "Error: line #{line}"
    err_string += ", col: #{pos}" unless pos.nil?
    case type
    when 1
      puts "#{err_string}, Wrong Indentation "
    when 2
      puts "#{err_string}, Spacing, expected single space after #{char}"
    when 3
      puts "#{err_string}, Spacing, expected single space before #{char}"
    when 4
      puts "#{err_string}, Line Format, Expected line break after #{char}"
    when 5
      puts "#{err_string}, Line Format, Expected one empty line after #{char}"
    else
      puts "#{err_string}, Other"
    end
  end
end
# rubocop: enable Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/MethodLength
