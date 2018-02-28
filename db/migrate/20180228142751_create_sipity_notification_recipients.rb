class CreateSipityNotificationRecipients < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_notification_recipients do |t|

      t.timestamps
    end
  end
end
