class AddInfoToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :district, :string
    add_column :candidates, :twitter_id, :string
    add_column :candidates, :facebook_id, :string 
    add_column :candidates, :website, :string
    add_column :candidates, :phone_number, :string
  end
end
