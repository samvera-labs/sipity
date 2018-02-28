class CreateSipityNotificationRecipients < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_notification_recipients do |t|
      t.integer  'notification_id',                null: false
      t.integer  'role_id',                        null: false
      t.string 'recipient_strategy', null: false
      t.timestamps
    end

    add_index 'sipity_notification_recipients', %w[notification_id role_id recipient_strategy], name: 'sipity_notifications_recipients_surrogate'
    add_index 'sipity_notification_recipients', ['notification_id'], name: 'sipity_notification_recipients_notification'
    add_index 'sipity_notification_recipients', ['recipient_strategy'], name: 'sipity_notification_recipients_recipient_strategy'
    add_index 'sipity_notification_recipients', ['role_id'], name: 'sipity_notification_recipients_role'
  end
end
