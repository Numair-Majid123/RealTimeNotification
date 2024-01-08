class CreateTriggers < ActiveRecord::Migration[7.1]
  def change
    create_table :triggers do |t|
      t.string :body, null: false
      t.string :to, null: false
      t.timestamps
    end
  end
end
