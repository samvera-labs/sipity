class CreateSipityAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_agents do |t|

      t.timestamps
    end
  end
end