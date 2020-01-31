# frozen_string_literal: true

# require StringScanner

# This class creates a buffer object that will be used for running checks
class Buffer
  attr_accessor :file_path, :line_ct, :content, :curr_line
  attr_reader :curr_line
  def initialize(file_path)
    self.file_path = file_path
    self.content = get_file_content(file_path)
    self.line_ct = content.length
    @curr_line = 1
    @curr_char = 1
    @curr_word = 1
  end

  def line_get
    content[@curr_line-1]
  end

  def line_get_ch
    line_chars = content[curr_line-1].split('')
    ch = line_chars[@curr_char-1]
    @curr_char += 1 unless @curr_char == line_chars.length
    ch
  end

  def line_get_word
    line_words = content[curr_line-1].split(' ')
    w = line_words[@curr_word-1]
    @curr_word += 1 unless @curr_word == line_words.length
    w
  end

  def line_next
    @curr_line += 1 unless @curr_line == @line_ct
    @curr_char = 1
  end

  def line_prev
    @curr_line -= 1 unless @curr_line == 1
    @curr_char = 1
  end
  
  def eof?
     @curr_line == @line_ct
  end

  def line_reset
    @curr_line = 1
    @curr_char = 1
    @curr_word = 1
  end

  private

  def get_file_content(file_path)
    content=''
    File.open(file_path, 'r') { |f| content = f.readlines.map(&:chomp) }
    content
  end
end

class Parser

  attr_accessor :buffer, :name, :blocks
  
  def initialize (buffer, name)
    self.buffer = buffer
    self.blocks = build_blocks
    self.name = name
  end

  def build_blocks (buffer,name)
    blocks = Hash.new
    
    name == buffer.line_get_word
   
  end

end


