class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
    end
  end

  def self.down
    drop_table :things
  end
end
