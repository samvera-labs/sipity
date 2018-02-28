class CreateSipityMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_methods do |t|
      t.string   'service_name',                    null: false
      t.integer  'weight',                          null: false
      t.integer 'workflow_action_id', index: true, null: false
      t.timestamps
    end
  end
end
