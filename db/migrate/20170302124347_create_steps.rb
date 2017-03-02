class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :title
      t.text :content
      t.integer :priority

      t.timestamps
    end
  end
end
