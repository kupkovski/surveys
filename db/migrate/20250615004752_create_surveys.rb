class CreateSurveys < ActiveRecord::Migration[7.2]
  def change
    create_table :surveys do |t|
      t.text :question, null: false

      t.timestamps
    end
  end
end
