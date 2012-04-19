# encoding: UTF-8

class Sentence
	def self.make_graph_of(sentence)
		words = sentence.scan(/[[:alpha:]]+/)
		words.each_with_index do |candidate, i|
			word = Word.find_by_text candidate
			if word and word.word_core.part == 'verb'
				return[[], word.word_core.infinitive] if words.length==1
				if i==0
					right_arm = self.findNoun(words[i+1, words.length])
					return [
									[
										{:edge => [right_arm[1], word.word_core.infinitive],
									 	 :type => "об'єкт"}
								 	] + right_arm[0],word.word_core.infinitive
								 ]
				elsif i==(words.length-1)
					left_arm = self.findNoun(words[0, i])
					return [[{:edge => [left_arm[1], word.word_core.infinitive],
									 :type => "діяч"}
									] + left_arm[0],word.word_core.infinitive]
				end

				left_arm = (i==1) ? [[],words[0]] : self.findNoun(words[0, i])
				right_arm = (i==words.length-2) ? [[],words[words.length-1]] : self.findNoun(words[i+1, words.length])
				puts "left_arm ==> #{left_arm} ||| right_arm ==> #{right_arm}"
				return [[{:edge => [left_arm[1], word.word_core.infinitive],
									:type => "діяч"},
								 {:edge => [right_arm[1], word.word_core.infinitive],
									:type => "об'єкт"}] + right_arm[0] + left_arm[0],word.word_core.infinitive]
			end
		end
		return[[],words.join(" ")]
	end
	
	private
	
	def self.findNoun(candidates)
		puts "#{candidates}"
		candidates.each_with_index do |candidate, i|
			word = Word.find_by_text candidate
			if word and word.word_core.part == 'noun'
				puts word.word_core.infinitive
				return[[] ,word.word_core.infinitive] if candidates.length==1
				return [[{:edge => [candidates[i+1, candidates.length].join(" "), word.word_core.infinitive],
									:type => "обставина"}], word.word_core.infinitive] if i==0
				return [[{:edge => [candidates[0, i].join(" "), word.word_core.infinitive],
									:type => "означення"}], word.word_core.infinitive] if i==(candidates.length-1)
				return [[
									{:edge => [candidates[0, i].join(" "), word.word_core.infinitive],
									 :type => "означення"},
									{:edge => [candidates[i+1, candidates.length].join(" "), word.word_core.infinitive],
									 :type => "обставина"}
								], word.word_core.infinitive]
			end
		end 
		return[[],candidates.join(" ")]
	end
end

