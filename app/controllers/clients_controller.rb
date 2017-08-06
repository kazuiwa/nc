#coding: utf-8
class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(record_params)
    if @client.save
      redirect_to :root
    else
      render "new"
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def record_params
    params.require(:client).permit(
        :sei,
        :mei,
        :kana_sei,
        :kana_mei,
        :sex,
        :birthday_year,
        :birthday_month_day,
        :postal_code,
        :address,
        :tel1,
        :tel2,
        :tel3,
        :mail,
        :douki,
        :douki_etc,
        :shoukaisha,
        :memo_client,
        :memo_admin
    )
  end
end
