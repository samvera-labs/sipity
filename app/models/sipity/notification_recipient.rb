module Sipity
  class NotificationRecipient < ApplicationRecord
    self.table_name = 'sipity_notification_recipients'
    belongs_to :notification, class_name: 'Sipity::Notification'
    belongs_to :role, class_name: 'Sipity::Role'

    enum(
      recipient_strategy: {
        'to' => 'to',
        'cc' => 'cc',
        'bcc' => 'bcc'
      }
    )
  end
end
