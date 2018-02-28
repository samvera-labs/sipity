class CreateSipityWorkflowStateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflow_state_actions do |t|

      t.timestamps
    end
  end
end
