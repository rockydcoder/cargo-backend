defmodule Cargo.Router.MerchantUsers do
  use Maru.Router
  alias Cargo.Repo.MerchantUsers, as: DB
  require Logger

  namespace :users do
    @desc "get user by username and password"
    params do
      requires :username, type: String
      requires :password, type: String
    end
    post do
      merchant = DB.getMerchant(params)
      conn
      |> put_status(200)
      |> json(merchant)
    end

    namespace :new do
      @desc "add new user"
      params do
        requires :username, type: String
        requires :password, type: String
        requires :licenseNumber, type: String
      end
      post do
        DB.addMerchantUser(params)
        conn
        |> send_resp(201, "")
      end
    end
  end

end
