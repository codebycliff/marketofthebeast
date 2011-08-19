class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.integer :user_id
      t.string :name
      t.string :bio
      t.string :origin
      t.string :years_active

      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
