class CreateSipityWorkflowResponsibilities < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflow_responsibilities do |t|
      t.integer  'agent_id', null: false
      t.integer 'workflow_role_id', null: false
      t.timestamps
    end
    add_index 'sipity_workflow_responsibilities', %w[agent_id workflow_role_id], name: 'sipity_workflow_responsibilities_aggregate', unique: true
  end
end
