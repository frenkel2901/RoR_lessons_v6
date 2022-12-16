class DropTableResults < ActiveRecord::Migration[6.0]
  def change
    drop_table :results do |t|
      t.references :user, null: false
      t.references :test, null: false
      t.timestamps null: false
    end
  end
end
