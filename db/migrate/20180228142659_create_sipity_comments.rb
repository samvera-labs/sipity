class CreateSipityComments < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_comments do |t|

      t.timestamps
    end
  end
end
