#coding: utf-8
class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :sei
      t.string :mei
      t.string :kana_sei
      t.string :kana_mei
      t.integer :sex
      t.string :birthday_year
      t.string :birthday_month_day
      t.string :postal_code
      t.string :address
      t.string :tel1
      t.string :tel2
      t.string :tel3
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
