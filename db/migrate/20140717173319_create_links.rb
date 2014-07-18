class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :slug
      t.integer :clicks,  :default => 0
      t.string :screenshot
      t.string :title

      t.timestamps
    end
  end
end
