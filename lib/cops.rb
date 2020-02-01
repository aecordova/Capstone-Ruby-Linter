
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


  def log_error(type, line)
    case type
    when 1
      puts "Error: Wrong Indentation  on line #{line}"
    else
      puts "Other"
    end
  end
end
