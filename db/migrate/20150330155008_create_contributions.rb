class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :donor_id
      t.integer :candidate_id
      t.integer :cycle
      t.float :individual_amount
      t.float :pac_amount
      t.float :total

      t.timestamps null: false
    end
  end
end
