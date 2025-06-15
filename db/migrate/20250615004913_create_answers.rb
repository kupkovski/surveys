class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.references :survey, null: false, foreign_key: true
      t.integer :value, null: false

      t.timestamps
    end
  end
end
