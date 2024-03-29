class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :question, null: false, foreign_key: true
      t.text :url, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
