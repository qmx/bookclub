class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.references :user
      t.references :book
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
