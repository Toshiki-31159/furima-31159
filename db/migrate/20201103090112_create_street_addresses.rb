class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|

      t.string     :postal_code,    nill: false
      t.string     :phone_number,   nill: false
      t.integer    :prefecture_id,  nill: false
      t.string     :municipality,   nill: false
      t.string     :address,        nill: false
      t.string     :building_name
      t.references :purchase_record, foreign_key: true
      t.timestamps
    end
  end
end
