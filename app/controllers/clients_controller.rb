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

    if params[:client]["birthday(1i)"].present?
      @client.birthday_year = params[:client]["birthday(1i)"]
    else
      @client.birthday_year = nil
    end

    if params[:client]["birthday(2i)"].present? && params[:client]["birthday(2i)"].length == 1
      params_birthday_month = "0" + params[:client]["birthday(2i)"]
    elsif params[:client]["birthday(2i)"].present?
      params_birthday_month = params[:client]["birthday(2i)"]
    else
      params_birthday_month = ""
    end

    if params[:client]["birthday(3i)"].present? && params[:client]["birthday(3i)"].length == 1
      params_birthday_day = "0" + params[:client]["birthday(3i)"]
    elsif params[:client]["birthday(3i)"].present?
      params_birthday_day = params[:client]["birthday(3i)"]
    else
      params_birthday_day = ""
    end

    @client.birthday_month_day = params_birthday_month + params_birthday_day

    if @client.save
      redirect_to :root
    else
      @set_birthday_year = params[:client]["birthday(1i)"]
      @set_birthday_month = params[:client]["birthday(2i)"]
      @set_birthday_day = params[:client]["birthday(3i)"]
      render "new"
    end
  end

  def edit
    @client = Client.find_by_id(params[:id])
    if @client.birthday_year.present?
      @set_birthday_year = @client.birthday_year.to_i
    end
    if @client.birthday_month_day.present?
      if @client.birthday_month_day[0] == "0"
        @set_birthday_month = @client.birthday_month_day[1].to_i
      else
        @set_birthday_month = @client.birthday_month_day[0..1].to_i
      end
      if @client.birthday_month_day[2] == "0"
        @set_birthday_day = @client.birthday_month_day[3].to_i
      else
        @set_birthday_day = @client.birthday_month_day[2..3].to_i
      end
    end
  end

  def update
    @client = Client.find_by_id(params[:id])
    @client.assign_attributes(record_params)
    @client.postal_code = params["zip11"]
    @client.address = params["addr11"]

    if params[:client]["birthday(1i)"].present?
      @client.birthday_year = params[:client]["birthday(1i)"]
    else
      @client.birthday_year = nil
    end

    if params[:client]["birthday(2i)"].present? && params[:client]["birthday(2i)"].length == 1
      params_birthday_month = "0" + params[:client]["birthday(2i)"]
    elsif params[:client]["birthday(2i)"].present?
      params_birthday_month = params[:client]["birthday(2i)"]
    else
      params_birthday_month = ""
    end

    if params[:client]["birthday(3i)"].present? && params[:client]["birthday(3i)"].length == 1
      params_birthday_day = "0" + params[:client]["birthday(3i)"]
    elsif params[:client]["birthday(3i)"].present?
      params_birthday_day = params[:client]["birthday(3i)"]
    else
      params_birthday_day = ""
    end

    @client.birthday_month_day = params_birthday_month + params_birthday_day

    if @client.save
      redirect_to :root
    else
      @set_birthday_year = params[:client]["birthday(1i)"]
      @set_birthday_month = params[:client]["birthday(2i)"]
      @set_birthday_day = params[:client]["birthday(3i)"]
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
