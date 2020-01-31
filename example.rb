# frozen_string_literal: true

# This class creates a buffer object that will be used for running checks
class Buffer
  attr_accessor :file_path, :line_ct, :content
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
    content[@curr_line]
  end

  def line_get_ch

