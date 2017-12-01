module Challenges
	class MorseCode
		MORSE_ALPHANUMERIC = { :A => '.-', :B => '-...', :C => '-.-.', :D => '-..', :E => '.', :F => '..-.',
		:G => '--.', :H => '....', :I => '..', :J => '.---', :K => '-.-', :L => '.-..', :M => '--',
		:N => '-.', :O => '---', :P => '.--.', :Q => '--.-', :R => '.-.', :S => '...', :T => '-',
		:U => '..-', :V => '...-', :W => '.--', :X => '-..-', :Y => '-.--', :Z => '--..',
		:"0" => '-----', :"1" => '.----', :"2" => '..---', :"3" => '...--', :"4" => '....-', :"5" => '.....',
		:"6" => '-....', :"7" => '--...', :"8" => '---..', :"9" => '----.', :"." => '.-.-.-', :"," => '--..--' }
		BASE_ALPHABET = 'A'.ord

		# Reads text from stdin and outputs an obfuscated morse version of the input text
		def stdin_text

		end

		# Reads from input_filepath and writes an obfuscated morse version of the input file into
		# the output_filepath provided
		def file_text(input_filepath, output_filepath)
			raise(ArgumentError, 'String input filepath is expected') unless input_filepath.is_a?(String)
			raise(ArgumentError, 'String output filepath is expected') unless output_filepath.is_a?(String)
			begin
				i = File.new(input_filepath)
				o = File.new(output_filepath, 'w')
				while !i.eof?
					o.write(obfuscate(to_morse(i.readline))+"\n")
				end
				i.close
				o.close 
			rescue IOError => e
				puts "#{e.message}"
			end
		end

		# Converts letters and numbers to each morse code equivalent. In addition, 
		# separate letters with pipe (|), and separate words with forward slash (/).
		# For example, given the sentence I AM IN TROUBLE, the resulting output should be:
		# ../.-|--/..|-./-|.-.|---|..-|-...|.-..|.
		def to_morse(alphanumeric_sentence)
			# upcases sentence and splits the sentence in words. The delimiter is one or more spaces
			words = alphanumeric_sentence.upcase.split(/\s+/)
			words_morse = words.map do |word|
				word_morse = word.chars.map do |c|
					MORSE_ALPHANUMERIC[c.to_sym]
				end
				word_morse.join('|')
			end
			return words_morse.join('/')
		end

		# Replace the number of consecutive dots with a number, and replace the number of consecutive
		# dashes with the letter of the alphabet at that position. 
		# E.g. S = ... = 3, Q = --.- = b1a, F = ..-. = 2a1.
		def obfuscate(morse_code)
			morse_code.gsub(/(\.+)|(-+)/) do |match|
				if match.include?('.')
					match.length.to_s
				else
					(BASE_ALPHABET + match.length - 1).chr
				end
 			end
		end	
	end
end