#coding: utf-8
class Client < ApplicationRecord

  attr_accessor :birthday

  validate :check_birthday_month_day

  def check_birthday_month_day
    if self.birthday_month_day.length != 4 && self.birthday_month_day.length != 0
      errors.add("生年月日の月日が不正です。", "")
    end
  end

  DOUKIES = [["ホットペッパー（本誌）", 1],
             ["ホットペッパー（インターネット）", 2],
             ["通りがかり", 3],
             ["紹介", 4],
             ["広告", 5],
             ["その他", 6]]

  class << self
    def get_csv_data
      require 'csv'
      require 'kconv'
      csv_data = CSV.generate(ouput = '') do |csv|
        #ヘッダー部分を作成
        header = %W(
          姓
          名
          セイ
          メイ
          性別
          生年月日-年
          生年月日-月日
          郵便番号
          住所
          電話番号-市外局番
          電話番号-市内局番
          電話番号-加入者番号
          メールアドレス
          来店動機
          来店動機-その他
          紹介者
          お客様メモ
          管理者メモ
          新規登録日時
        )
        csv << header

        #データ部分を作成
        clients = Client.all.order("id desc")
        clients.each do |client|
          col = []
          col << client.sei  # => 姓
          col << client.mei  # => 名
          col << client.kana_sei  # => セイ
          col << client.kana_mei  # => メイ
          col << client.sex  # => 性別
          col << client.birthday_year  # => 生年月日-年
          col << client.birthday_month_day  # => 生年月日-月日
          col << client.postal_code  # => 郵便番号
          col << client.address  # => 住所
          col << client.tel1  # => 電話番号-市外局番
          col << client.tel2  # => 電話番号-市内局番
          col << client.tel3  # => 電話番号-加入者番号
          col << client.mail  # => メールアドレス
          col << client.douki  # => 来店動機
          col << client.douki_etc  # => 来店動機-その他
          col << client.shoukaisha  # => 紹介者
          col << client.memo_client  # => お客様メモ
          col << client.memo_admin  # => 管理者メモ
          col << Time.now  # => 新規登録日時
          csv << col
        end
      end

      #文字コードをsjis変換
      #csv_data = csv_data.tosjis
      csv_data
    end
  end
end
