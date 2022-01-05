class CreateWordOfMouths < ActiveRecord::Migration[6.0]
  def change
    create_table :word_of_mouths do |t|

      t.timestamps
    end
  end
end
