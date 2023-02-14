class CreateShippongCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :shippong_costs do |t|

      t.timestamps
    end
  end
end
