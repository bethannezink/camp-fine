class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :state
      t.string :party
      t.string :chamber
      t.integer  :first_elected
      t.float :total
      t.float :spent
      t.float :cash_on_hand
      t.float :debt

      t.timestamps null: false
    end
  end
end
