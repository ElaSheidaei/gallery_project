class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.string :reaction_type
      t.references :user, null: false, foreign_key: true
      t.references :gallery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
