class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :organization_id
      t.string :name
      t.string :friendliness_rating
      t.integer :min_age
      t.integer :max_age
      t.string :health_status_req
      t.string :gender_req
      t.text :access_to_services
      t.text :description
      t.text :program_timing
      t.string :language_req
      t.string :program_categorization
      t.string :services

      t.timestamps
    end
  end
end
