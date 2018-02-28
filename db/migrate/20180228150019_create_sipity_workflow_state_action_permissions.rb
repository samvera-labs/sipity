class CreateSipityWorkflowStateActionPermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflow_state_action_permissions do |t|
      t.integer  'workflow_role_id', null: false
      t.integer 'workflow_state_action_id', null: false
      t.timestamps
    end

    add_index 'sipity_workflow_state_action_permissions', %w[workflow_role_id workflow_state_action_id], name: 'sipity_workflow_state_action_permissions_aggregate', unique: true
  end
end
