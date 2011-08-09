class CreateRelays < ActiveRecord::Migration
  def self.up
    create_table :relays do |t|
      t.string :user
      t.text :content
      t.references :talk

      t.timestamps
    end

    add_index :relays, :talk_id
  end

  def self.down
    drop_table :relays
  end
end
