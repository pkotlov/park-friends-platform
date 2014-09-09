class CreatePspaces < ActiveRecord::Migration
  def change
    create_table :pspaces do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :availability
      t.boolean :post_on_facebook
      t.boolean :parked

      t.timestamps
    end
  end
end
