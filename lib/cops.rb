
module Cops
  def indent_cop(parsed_file)
    parsed_file.blocks.each do |x|
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
      spc_check_after(line, s, '\)')
      spc_check_after(line, s, ',')
      spc_check_after(line, s, ':')
    end
  end
  
  def spc_check_after(line, str, char)
    str.scan_until(Regexp.new(char))
    while str.matched?
      str.scan(/\s+/)
      log_error(2, line, char, str.pos) if str.matched != ' '
      str.scan_until(Regexp.new(char))
    end
  end


  def log_error(type, line, char = nil,pos=nil)
    err_string = "Error: line #{line}"
    err_string +=", col: #{pos} " unless pos.nil?
    case type
    when 1
      puts "#{err_string}, Wrong Indentation "
    when 2
      puts "#{err_string}, Wrong spacing after '#{char}' "
    else
      puts "Other"
    end
  end
end
