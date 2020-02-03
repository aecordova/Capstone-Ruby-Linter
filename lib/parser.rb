# frozen_string_literal: true

# require StringScanner

# This class creates a buffer object that will be used for running checks
class Buffer
  attr_accessor :file_path, :line_ct, :content_s, :curr_line

  def initialize(file_path)
    self.file_path = file_path
    self.content_s = get_file_content(file_path)
    self.line_ct = content_s.length
    @curr_line = 1
    @curr_char = 1
    @curr_word = 1
  end

  def line_get
    content_s[@curr_line - 1]
  end

  def line_get_ch
    line_chars = content_s[curr_line - 1].split('')
    ch = line_chars[@curr_char - 1]
    @curr_char += 1 unless @curr_char == line_chars.length
    ch
  end

  def line_get_word
    line_words = content_s[curr_line - 1].split(' ')
    w = line_words[@curr_word - 1]
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
    content_s = ''
    File.open(file_path, 'r') { |f| content_s = f.readlines.map(&:chomp) }
    content_scan = content_s.map { |v| v = StringScanner.new(v) }
    content_scan
  end
end
# This class returns an array of string scanners,
# with the identified level of indentation, line number and String scanners
class Parser
  attr_accessor :content_s, :keywords, :blocks

  def initialize(content_s, keywords)
    self.content_s = content_s
    @keywords = keywords
    self.blocks = build_blocks(content_s, keywords)
  end

  # rubocop: disable Metrics/MethodLength
  def build_blocks(c_s, keywords)
    blocks = []
    level = 0
    c_s.each_with_index do |s, i|
      added = false
      keywords.each do |k|
        next unless s.exist?(Regexp.new(k))

        blocks.push([i + 1, level, s])
        added = true
        level += 1
      end
      level -= 1 if s.exist?(/}/) && level.positive?
      blocks.push([i + 1, level, s]) unless added
    end
    blocks
  end
end
# rubocop: enable Metrics/MethodLength
