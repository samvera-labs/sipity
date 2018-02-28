class CreateSipityComments < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_comments do |t|
      t.integer  'entity_id',                                                    null: false
      t.integer  'agent_id',                                                     null: false
      t.text 'comment'
      t.timestamps
    end

    add_index 'sipity_comments', ['agent_id'], name: 'index_sipity_comments_on_agent_id'
    add_index 'sipity_comments', ['created_at'], name: 'index_sipity_comments_on_created_at'
    add_index 'sipity_comments', ['entity_id'], name: 'index_sipity_comments_on_entity_id'
  end
end
