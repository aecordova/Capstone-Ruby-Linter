# frozen_string_literal: true

# This class creates a buffer object that will be used for running checks
class Buffer
  attr_accessor :file_path, :line_ct, :content
  attr_reader :curr_line
  def initialize(file_path)
    self.file_path = file_path
    self.content = get_file_content(file_path)
    self.line_ct = content.length
    @curr_line = 0
    @curr_char = 0
  end

  def line_get
    content[@curr_line]
  end

  def line_get_ch
    line_chars = content[curr_line].split('')
    ch = line_chars[@curr_char]
    @curr_char += 1 unless @curr_char == line_chars.length
    ch
  end

  def line_next
    @curr_line += 1 unless @curr_line == @line_ct
    @curr_char = 0
  end
  def line_prev
    @curr_line -= 1 unless @curr_line.zero?
    @curr_char = 0
  end

  def line_reset
    @curr_line = 0
    @curr_char = 0
  end

  private

  def get_file_content(file_path)
    content=[]
    File.open(file_path, 'r') do |file|
      file.readlines.each do |line|
        content << line.chomp
      end
    end
    content
  end
end
