class CreateSipityWorkflows < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_workflows do |t|
      t.string   'name', null: false
      t.string   'label'
      t.text 'description'
      t.timestamps
    end
    add_index 'sipity_workflows', ['name'], name: 'index_sipity_workflows_on_name', unique: true
  end
end
