class Sentence
	def self.make_graph_of(sentence)
		puts "MMEETHOD INVOKE!!"
		words = sentence.scan(/[[:alpha:]]+/)
		puts words
		split = 0
		graph = {}
		words.each_with_index do |candidate, i|
			word = Word.find_by_text candidate
			if word and word.word_core.part == 'verb'
					graph = {words[0, i].join(" ") => word.word_core.infinitive, words[i+1, words.length].join(" ") => word.word_core.infinitive}
					puts i
					break
			end
		end
		puts graph
		return graph
	end
end