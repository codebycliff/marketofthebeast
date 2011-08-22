class AddFiletypeToDownloads < ActiveRecord::Migration
  def self.up
    add_column :downloads, :filetype, :string
  end

  def self.down
    remove_column :downloads, :filetype
  end
end
