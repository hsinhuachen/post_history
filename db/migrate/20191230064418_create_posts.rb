class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :msg
      t.text :thumb
      t.boolean :published, defaule: true
      t.integer :sorting, default: 0

      t.timestamps
    end
  end
end

