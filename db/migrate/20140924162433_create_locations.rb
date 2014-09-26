class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer  "organization_id" 
      t.integer  "program_id" 
      t.float    "latitude" 
      t.float    "longitude" 
      
      # google place api 
      t.string   "place_id" 
      t.string   "address" 
      t.string   "address2" 
      t.string   "city" 
      t.string   "state" 
      t.string   "zip" 
      t.string   "phone_no" 
      t.timestamps 
    end
  end
end
