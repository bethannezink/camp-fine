class CreateOpenSecrets < ActiveRecord::Migration
  def change
    create_table :open_secrets do |t|

      t.timestamps null: false
    end
  end
end
