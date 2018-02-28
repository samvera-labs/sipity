class CreateSipityMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_methods do |t|

      t.timestamps
    end
  end
end
