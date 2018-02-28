class CreateSipityAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_agents do |t|
      t.string   'proxy_for_id', null: false
      t.string 'proxy_for_type', null: false
      t.timestamps
    end
    add_index 'sipity_agents', %w[proxy_for_id proxy_for_type], name: 'sipity_agents_proxy_for', unique: true
  end
end
