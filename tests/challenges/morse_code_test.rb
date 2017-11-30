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