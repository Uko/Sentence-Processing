class WordCore < ActiveRecord::Base
	attr_accessible :infinitive, :part
	has_many :words, :dependent => :destroy
	def self.all_parts
		%w(noun verb adjective adverb)
	end
	validates_presence_of :infinitive, :part
	validates_uniqueness_of :infinitive
	validates_inclusion_of :part, :in => self.all_parts, :message => "part of language: %s is unknown"
end
