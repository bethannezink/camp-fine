class CreateIndustryContributions < ActiveRecord::Migration
  def change
    create_table :industry_contributions do |t|

      t.integer :industry_id
      t.integer :candidate_id
      t.integer :cycle
      t.float :individual_amount
      t.float :pac_amount
      t.float :total
      t.timestamps null: false
    end
  end
end
