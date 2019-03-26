class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|

      t.string     :uuid,                 null: false, limit: 129, default: ""
      t.string     :title,                null: false, limit: 300
      t.text       :description,          null: false

      t.timestamps
    end
  end
end