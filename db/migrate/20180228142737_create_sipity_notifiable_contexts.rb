class CreateSipityNotifiableContexts < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_notifiable_contexts do |t|

      t.timestamps
    end
  end
end
