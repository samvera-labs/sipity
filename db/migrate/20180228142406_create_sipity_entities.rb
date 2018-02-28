class CreateSipityEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_entities do |t|
      t.string   'proxy_for_global_id',           null: false
      t.integer  'workflow_id',                   null: false
      t.integer 'workflow_state_id', null: true
      t.timestamps
    end

    add_index 'sipity_entities', ['proxy_for_global_id'], name: 'sipity_entities_proxy_for_global_id', unique: true
    add_index 'sipity_entities', ['workflow_id'], name: 'index_sipity_entities_on_workflow_id'
    add_index 'sipity_entities', ['workflow_state_id'], name: 'index_sipity_entities_on_workflow_state_id'
  end
end
