class AddCreatorToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :creator, references: :users, index: true
    add_foreign_key :posts, :users, column: :creator_id
  end
end
