class CreateAddeds < ActiveRecord::Migration
  def change
    create_table :addeds do |t|
      t.references :user, index: true
      t.references :song, index: true

      t.timestamps
    end
  end
end
