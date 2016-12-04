defmodule Cargo.Router.Merchants do
  use Maru.Router
  alias Cargo.Repo.Merchants, as: DB
  require Logger

  namespace :merchants do

    @desc "get all merchants"
    get do
      merchants = DB.getMerchants
      conn
      |> put_status(200)
      |> json(merchants)
    end

    @desc "get merchant by field name"
    params do
      requires :fieldName, type: String
      requires :fieldValue, type: String
    end
    post do
      merchants = DB.getMercantsByGenericField(params)
      conn
      |> put_status(200)
      |> json(merchants)
    end

    namespace :new do
      @desc "add a new merchant"
      params do
        requires :merchantName, type: String
        requires :companyName, type: String
        requires :contactNumber, type: String
        requires :licenseNumber, type: String
      end
      post do
        DB.addMerchant(params)
        conn
        |> send_resp(201, "")
      end
    end
  end


end
