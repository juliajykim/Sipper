class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.integer :location_id, null: false
      t.integer :age
      t.string :fav_language
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :location_id
    add_index :users, :session_token, unique: true

    create_table :locations do |t|
      t.string :city, null: false

      t.timestamps
    end

    add_index :locations, :city, unique: true

    create_table :sips do |t|
      t.text :body, null: false
      t.integer :author_id, null: false

      t.timestamps
    end

    add_index :sips, :author_id

    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.integer :sip_id, null: false
      t.timestamps
    end

    add_index :likes, :sip_id
    add_index :likes, [:liker_id, :sip_id], unique: true
  end
end
