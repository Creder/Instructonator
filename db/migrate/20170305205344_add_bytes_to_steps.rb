class AddBytesToSteps < ActiveRecord::Migration[5.0]
  def change
    add_column :steps, :bytes, :integer
  end
end
