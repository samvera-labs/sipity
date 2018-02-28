class CreateSipityWorkflowActions < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflow_actions do |t|
      t.integer  'workflow_id', null: false
      t.integer  'resulting_workflow_state_id'
      t.string 'name', null: false
      t.timestamps
    end

    add_index 'sipity_workflow_actions', ['resulting_workflow_state_id'], name: 'sipity_workflow_actions_resulting_workflow_state'
    add_index 'sipity_workflow_actions', %w[workflow_id name], name: 'sipity_workflow_actions_aggregate', unique: true
    add_index 'sipity_workflow_actions', ['workflow_id'], name: 'sipity_workflow_actions_workflow'
  end
end
