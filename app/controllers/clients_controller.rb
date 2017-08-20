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

  def csv_output
    csv_data = Client.get_csv_data
    title = "NC"
    send_data(csv_data,
            type: 'text/csv',
            x_sendfile: true,
            filename: "#{title}_#{Time.now.strftime('%Y%m%d%H%M%S')}.csv"
            .kconv(Kconv::UTF8)
    )
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
