class CreateWordCores < ActiveRecord::Migration
  def up
    create_table :word_cores do |t|
      t.string :infinitive
      t.string :part

      t.timestamps
    end
  end

	def down
		drop_table :word_cores
	end
end
