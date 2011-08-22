class CreateDownloads < ActiveRecord::Migration
  def self.up
    create_table :downloads do |t|
      t.integer :artist_id
      t.string :title
      t.string :filename

      t.timestamps
    end
  end

  def self.down
    drop_table :downloads
  end
end
