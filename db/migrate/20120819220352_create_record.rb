class CreateRecord < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.string :comments
      t.timestamps
    end
  end

end
