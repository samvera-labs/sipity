class CreateSipityWorkflowStateResponsibilities < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflow_state_responsibilities do |t|

      t.timestamps
    end
  end
end
