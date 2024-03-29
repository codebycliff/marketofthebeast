class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.string :title
      t.text :description
      t.datetime :when
      t.string :where
      t.string :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
