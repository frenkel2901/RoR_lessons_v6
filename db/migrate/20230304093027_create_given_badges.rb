class CreateGivenBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :given_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
