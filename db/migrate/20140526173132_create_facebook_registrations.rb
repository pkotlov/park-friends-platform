class CreateFacebookRegistrations < ActiveRecord::Migration
  def change
    create_table :facebook_registrations do |t|
      t.string :facebook
      t.string :facebookId
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
