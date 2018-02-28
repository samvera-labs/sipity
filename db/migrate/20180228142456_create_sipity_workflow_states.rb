class CreateSipityWorkflowStates < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflow_states do |t|
      t.integer  'workflow_id',             null: false
      t.string 'name', null: false
      t.timestamps
    end
    add_index 'sipity_workflow_states', ['name'], name: 'index_sipity_workflow_states_on_name'
    add_index 'sipity_workflow_states', %w[workflow_id name], name: 'sipity_type_state_aggregate', unique: true
  end
end
