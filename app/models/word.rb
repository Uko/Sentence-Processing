class Word < ActiveRecord::Base
  belongs_to :word_core
  attr_accessible :text, :word_core_id

	validates_presence_of :text, :word_core
end
