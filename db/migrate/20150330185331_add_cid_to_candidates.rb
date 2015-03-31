class AddCidToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :cid, :string
  end
end
