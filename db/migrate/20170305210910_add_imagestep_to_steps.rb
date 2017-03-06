class AddImagestepToSteps < ActiveRecord::Migration[5.0]
  def change
    add_column :steps, :stepimage, :string
  end
end
