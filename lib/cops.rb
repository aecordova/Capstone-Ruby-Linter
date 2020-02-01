
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
      s.scan_until(/:/)
      next unless s.matched?

      s.scan(/\s+/)
      l = 0 if s.matched.nil?
      l = s.matched.length unless s.matched.nil?
      log_error(2,line,':') if l != 1
    end
  end


  def log_error(type, line, char = nil)
    err_string = "Error:line #{line}"
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
