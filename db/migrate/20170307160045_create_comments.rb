class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :step_id
      t.integer :user_id	
      t.string :author
      t.text :content

      t.timestamps
    end
  end
end
