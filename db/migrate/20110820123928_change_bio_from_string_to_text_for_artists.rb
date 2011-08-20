class ChangeBioFromStringToTextForArtists < ActiveRecord::Migration

  def self.up
    change_column :artists, :bio, :text 
  end

  def self.down
  end
end
