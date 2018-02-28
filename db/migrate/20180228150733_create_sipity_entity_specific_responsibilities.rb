class CreateSipityEntitySpecificResponsibilities < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_entity_specific_responsibilities do |t|
      t.integer  'workflow_role_id',            null: false
      t.string   'entity_id',                   null: false
      t.integer 'agent_id', null: false
      t.timestamps
    end
    add_index 'sipity_entity_specific_responsibilities', ['agent_id'], name: 'sipity_entity_specific_responsibilities_agent'
    add_index 'sipity_entity_specific_responsibilities', ['entity_id'], name: 'sipity_entity_specific_responsibilities_entity'
    add_index 'sipity_entity_specific_responsibilities', %w[workflow_role_id entity_id agent_id], name: 'sipity_entity_specific_responsibilities_aggregate', unique: true
    add_index 'sipity_entity_specific_responsibilities', ['workflow_role_id'], name: 'sipity_entity_specific_responsibilities_role'
  end
end
