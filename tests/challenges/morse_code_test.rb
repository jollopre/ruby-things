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