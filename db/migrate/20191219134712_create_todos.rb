class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
