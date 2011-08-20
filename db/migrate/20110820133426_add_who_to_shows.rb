class AddWhoToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :who, :string
  end

  def self.down
    remove_column :shows, :who
  end
end
