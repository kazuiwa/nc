#coding: utf-8
class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :sei
      t.string :mei
      t.string :kana_sei
      t.string :kana_mei
      t.boolean :sex
      t.string :birthday_year
      t.string :birthday_month_day
      t.string :postal_code
      t.integer :tel1
      t.integer :tel2
      t.integer :tel3
      t.string :mail
      t.string :douki
      t.string :douki_etc
      t.string :shoukaisha
      t.string :memo_client
      t.string :memo_admin

      t.timestamps
    end
  end
end
