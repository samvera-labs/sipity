class CreateSipityWorkflowStateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflow_state_actions do |t|
      t.integer  'originating_workflow_state_id', null: false
      t.integer 'workflow_action_id', null: false
      t.timestamps
    end

    add_index 'sipity_workflow_state_actions', %w[originating_workflow_state_id workflow_action_id], name: 'sipity_workflow_state_actions_aggregate', unique: true
  end
end
