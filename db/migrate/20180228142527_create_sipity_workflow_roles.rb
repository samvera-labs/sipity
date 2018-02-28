class CreateSipityWorkflowRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflow_roles do |t|
      t.integer  'workflow_id', null: false
      t.integer 'role_id', null: false
      t.timestamps
    end
    add_index 'sipity_workflow_roles', %w[workflow_id role_id], name: 'sipity_workflow_roles_aggregate', unique: true
  end
end
