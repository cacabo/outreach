class CreateReaches < ActiveRecord::Migration[5.1]
  def change
    create_table :reaches do |t|
      t.references :contact, foreign_key: true
      t.timestamp :time
      t.text :notes

      t.timestamps
    end
  end
end
