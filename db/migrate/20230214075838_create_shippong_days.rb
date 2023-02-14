class CreateShippongDays < ActiveRecord::Migration[6.0]
  def change
    create_table :shippong_days do |t|

      t.timestamps
    end
  end
end
