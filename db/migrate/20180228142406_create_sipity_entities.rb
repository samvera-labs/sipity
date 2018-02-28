class CreateSipityEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :sipity_entities do |t|

      t.timestamps
    end
  end
end
