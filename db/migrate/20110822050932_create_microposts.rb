class CreateMicroposts < ActiveRecord::Migration
  def self.up
    create_table :microposts do |t|
      t.integer :user_id
      t.string :content

      t.timestamps
    end
    add_index :microposts, :user_id
    add_index :microposts, :created_at
  end

  def self.down
    drop_table :microposts
  end
end
