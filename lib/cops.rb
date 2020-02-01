
module Cops
  def indent_cop(parsed_file)
    parsed_file.blocks.each do |x|
      x[2].reset
      sp = x[2].scan(/\s+/)
      if sp.nil?
        sp = 0
      else
        sp = sp.length
      end 
      log_error(1,x[0]) unless sp ==  x[1]*2
    end
  end

  def spacing_cop(parsed_file)
    l = 0
    parsed_file.blocks.each do |x|
      line, s = x[0], x[2]
      spc_check_before(line, s, '{')
      spc_check_before(line, s, '\(')
      spc_check_after(line, s, '\)')
      spc_check_after(line, s, ',')
      spc_check_after(line, s, ':')
    end
  end
  
  def spc_check_before(line, str, char)
    str.reset
    s = str.scan_until(Regexp.new(char))
    while str.matched?
      s = StringScanner.new(s.reverse)
      s.skip(Regexp.new(char))
      s.scan(/\s+/)
      log_error(3, line, char,s.string.length - s.pos) if s.matched != ' '
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

  def log_error(type, line, char = nil, pos = nil)
    err_string = "Error: line #{line}"
    err_string += ", col: #{pos}" unless pos.nil?
    case type
    when 1
      puts "#{err_string}, Wrong Indentation "
    when 2
      puts "#{err_string}, Wrong spacing after '#{char}' "
    when 3
      puts "#{err_string}, Wrong spacing before '#{char}' "
    else
      puts "Other"
    end
  end
end
