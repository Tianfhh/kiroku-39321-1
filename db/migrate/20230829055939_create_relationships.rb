class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|

      t.references :following
      t.references :follower
      
      t.timestamps
    end
  end
end
