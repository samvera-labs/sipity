class CreateSipityNotifiableContexts < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_notifiable_contexts do |t|
      t.integer  'scope_for_notification_id',               null: false
      t.string   'scope_for_notification_type',             null: false
      t.string   'reason_for_notification',                 null: false
      t.integer 'notification_id', null: false
      t.timestamps
    end

    add_index 'sipity_notifiable_contexts', ['notification_id'], name: 'sipity_notifiable_contexts_notification_id'
    add_index 'sipity_notifiable_contexts', %w[scope_for_notification_id scope_for_notification_type reason_for_notification notification_id], name: 'sipity_notifiable_contexts_concern_surrogate', unique: true
    add_index 'sipity_notifiable_contexts', %w[scope_for_notification_id scope_for_notification_type reason_for_notification], name: 'sipity_notifiable_contexts_concern_context'
    add_index 'sipity_notifiable_contexts', %w[scope_for_notification_id scope_for_notification_type], name: 'sipity_notifiable_contexts_concern'
  end
end
