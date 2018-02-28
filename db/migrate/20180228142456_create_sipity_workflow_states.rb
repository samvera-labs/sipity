class CreateSipityWorkflowStates < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflow_states do |t|

      t.timestamps
    end
  end
end
