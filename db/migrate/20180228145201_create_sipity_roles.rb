class CreateSipityRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_roles do |t|
      t.string   'name', null: false
      t.text     'description'
      t.timestamps
    end

    add_index 'sipity_roles', ['name'], name: 'index_sipity_roles_on_name', unique: true
  end
end
