class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :user_id, :null => false                        # foreign key
      
      t.string :title, :null => false
      t.text :teaser, :null => false
      t.text :body, :null => false
      t.text :version
      t.text :changelog
      
      t.text :freezebody                                        # on acceptance of an article, the body is copied in this field     
      t.integer :state, :null => false, :default => 0           # 0...draft, 1...submitted, 2...rejected, 3...full article, 4...featured article
      t.string :message                                         # message to author on reject
      t.datetime :submitted
      t.datetime :accepted

      t.timestamps
    end
    
    add_index :articles, :user_id
  end

  def self.down
    drop_table :articles
  end
end
