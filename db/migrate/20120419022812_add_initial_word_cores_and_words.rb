# encoding: UTF-8
class AddInitialWordCoresAndWords < ActiveRecord::Migration
  INITIAL_WORDCORES = [
    {:infinitive => 'мити', :part => 'verb'},
    {:infinitive => 'копати', :part => 'verb'},
    {:infinitive => 'плисти', :part => 'verb'},
    {:infinitive => 'цюкати', :part => 'verb'},
    {:infinitive => 'творити', :part => 'verb'},
    {:infinitive => 'бігти', :part => 'verb'},
    {:infinitive => 'їсти', :part => 'verb'},
    {:infinitive => 'спати', :part => 'verb'},
    {:infinitive => 'говорити', :part => 'verb'},
    {:infinitive => 'думати', :part => 'verb'},

    {:infinitive => 'мама', :part => 'noun'},
    {:infinitive => 'я', :part => 'noun'},
    {:infinitive => 'ти', :part => 'noun'},
    {:infinitive => 'він', :part => 'noun'},
    {:infinitive => 'вона', :part => 'noun'},
    {:infinitive => 'стіл', :part => 'noun'},
    {:infinitive => 'сіно', :part => 'noun'},
    {:infinitive => 'небо', :part => 'noun'},
    {:infinitive => 'чай', :part => 'noun'},
    {:infinitive => 'кактус', :part => 'noun'},
    
    {:infinitive => 'пила', :part => 'noun'},
    {:infinitive => 'кінь', :part => 'noun'},
    {:infinitive => 'трава', :part => 'noun'},
    {:infinitive => 'Ігор', :part => 'noun'},
    {:infinitive => 'Юрко', :part => 'noun'},
    {:infinitive => 'Ростик', :part => 'noun'},
    {:infinitive => 'рама', :part => 'noun'},
    {:infinitive => 'вітер', :part => 'noun'},
    {:infinitive => 'козак', :part => 'noun'},
    {:infinitive => 'мило', :part => 'noun'},

    {:infinitive => 'біла', :part => 'adjective'},
    {:infinitive => 'гарна', :part => 'adjective'},
    {:infinitive => 'багряний', :part => 'adjective'},
    {:infinitive => 'вороний', :part => 'adjective'},
    {:infinitive => 'чорнобровий', :part => 'adjective'},
    {:infinitive => 'широкий', :part => 'adjective'},
    {:infinitive => 'глибокий', :part => 'adjective'},
    {:infinitive => 'міцний', :part => 'adjective'},
    {:infinitive => 'захоплюючий', :part => 'adjective'},
    {:infinitive => 'розумний', :part => 'adjective'},
    {:infinitive => 'лисий', :part => 'adjective'},
    {:infinitive => 'бородатий', :part => 'adjective'},
    {:infinitive => 'патлатий', :part => 'adjective'},
    {:infinitive => 'швидкий', :part => 'adjective'},
    {:infinitive => 'смачний', :part => 'adjective'},
    {:infinitive => 'корисний', :part => 'adjective'},
    {:infinitive => 'сухе', :part => 'adjective'},
    {:infinitive => 'блакитне', :part => 'adjective'},
    {:infinitive => 'грузинський', :part => 'adjective'},
    {:infinitive => 'п’янкий', :part => 'adjective'},

    {:infinitive => 'швидко', :part => 'adverb'},
    {:infinitive => 'стрімко', :part => 'adverb'},
    {:infinitive => 'хвацько', :part => 'adverb'},
    {:infinitive => 'сильно', :part => 'adverb'},
    {:infinitive => 'навкруги', :part => 'adverb'},
    {:infinitive => 'глибше', :part => 'adverb'},
    {:infinitive => 'вчора', :part => 'adverb'},
    {:infinitive => 'вперед', :part => 'adverb'},
    {:infinitive => 'спросоння', :part => 'adverb'},
    {:infinitive => 'наполегливо', :part => 'adverb'}
  ]
  INITIAL_WORDS = [
  #here not the real ids - here only infinitife forms, ids are got in the "up"
    {:text => 'гарна', :word_core_id => 'гарна'},
    {:text => 'мама', :word_core_id => 'мама'},
    {:text => 'мила', :word_core_id => 'мити'},
    {:text => 'білу', :word_core_id => 'біла'},
    {:text => 'раму', :word_core_id => 'рама'},
    {:text => 'швидко', :word_core_id => 'швидко'}
  ]
  def up
    INITIAL_WORDCORES.each do |wordCore|
      WordCore.create!(wordCore)
    end
    INITIAL_WORDS.each do |word|
      word[:word_core_id] = WordCore.find_by_infinitive(word[:word_core_id]).id
      Word.create!(word)
    end
  end

  def down
    INITIAL_WORDS.each do |word|
      Word.find_by_infinitive(word[:text]).destroy
    end
    INITIAL_WORDCORES.each do |wordCore|
      WordCore.find_by_infinitive(wordCore[:infinitive]).destroy
    end
  end
end
