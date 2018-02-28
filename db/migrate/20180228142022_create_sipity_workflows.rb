class CreateSipityWorkflows < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflows do |t|

      t.timestamps
    end
  end
end
