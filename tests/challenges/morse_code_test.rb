require 'minitest/autorun'
require_relative '../../challenges/morse_code'

describe 'to_morse instance method' do 
	before do
		@morse_code = Challenges::MorseCode.new
	end 
	it 'should convert a sentence with just characters from alphabet' do
		assert_equal('../.-|--/..|-./-|.-.|---|..-|-...|.-..|.',
			@morse_code.to_morse('I AM IN TROUBLE'))
		assert_equal('../.-|--/..|-./-|.-.|---|..-|-...|.-..|.',
			@morse_code.to_morse('I    AM    IN    TROUBLE   '))
	end
	it 'should convert a sentence with just numbers' do
		assert_equal('.----|..---|...--/....-|.....|-..../--...|---..|----./-----',
			@morse_code.to_morse('123 456 789 0'))
	end
	it 'should convert a sentence with alphanumeric characteres' do
		# TODO
	end
end

describe 'obfuscate instance method' do
	before do
		@morse_code = Challenges::MorseCode.new
	end
	it 'should obfuscate a morse letter' do
		assert_equal('3', @morse_code.obfuscate('...'))
		assert_equal('B1A', @morse_code.obfuscate('--.-'))
		assert_equal('2A1', @morse_code.obfuscate('..-.'))
	end
	it 'should obfuscate a sentence' do
		assert_equal('2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1', 
			@morse_code.obfuscate('../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'))
	end
end

describe 'file_text instance method' do
	before do
		@morse_code = Challenges::MorseCode.new
		@output_filepath = './tests/fixtures/challenges/morse_code1_output.txt'
	end
	it 'raises ArgumentError when input_filepath is not String' do
		e = assert_raises(ArgumentError) do
			@morse_code.file_text(nil, nil)
		end
		assert_equal('String input filepath is expected', e.message)	
	end
	it 'raises ArgumentError when output_filepath is not String' do
		e = assert_raises(ArgumentError) do
			@morse_code.file_text('/path/to/input_file', nil)
		end
		assert_equal('String output filepath is expected', e.message)	
	end
	it 'reads from input_filepath and writes into output_filepath its obfuscated morse' do
		@morse_code.file_text('./tests/fixtures/challenges/morse_code1.txt',
			@output_filepath)
		assert(File.exist?(@output_filepath))
		io = File.new(@output_filepath)
		line = io.readline
		assert_equal('4|1|1A2|1A2|C', line.chop)
		line = io.readline
		assert_equal('2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1', line.chop)
		io.close
	end
end

# TODO gracefully handle strange or invalid inputs