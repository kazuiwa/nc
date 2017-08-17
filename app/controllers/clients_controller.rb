#coding: utf-8
class ClientsController < ApplicationController
  def index
    @clients = Client.paginate(page: params[:page], per_page: 10).order("created_at desc")
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(record_params)
    @client.postal_code = params["zip11"]
    @client.address = params["addr11"]
    if @client.save
      redirect_to :root
    else
      render "new"
    end
  end

  def edit
    @client = Client.find_by_id(params[:id])
  end

  def update
    @client = Client.find_by_id(params[:id])
    @client.assign_attributes(record_params)
    @client.postal_code = params["zip11"]
    @client.address = params["addr11"]
    if @client.save
      redirect_to :root
    else
      render "edit"
    end
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
