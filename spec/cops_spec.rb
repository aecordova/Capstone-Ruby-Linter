require_relative '../lib/cops.rb'

describe Cops do
  before (:all) do 
    let! (:file_path) {'../spec/test_files/indent_test.css'}
    let! (:kw) {['{']}
    let! (:b) {Buffer.new(file_path)}
    let! (:parsed_file) {Parser.new(b.content_s, kw)}
   end
  describe '#indent_cop' do
    it 'should return an error when detecting an wrong indentation' do
      Cops.indent_cop(parsed_file)
    end.to output('spec/test_files/indent_test.css').to_stdout  
end
