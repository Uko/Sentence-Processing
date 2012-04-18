class CreateWords < ActiveRecord::Migration
  def up
    create_table :words do |t|
      t.string :text
      t.references :word_core

      t.timestamps
    end
    add_index :words, :word_core_id
  end

	def down
		remove_index :words, :word_core_id
		drop_table :words
	end
end
