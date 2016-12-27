defmodule Cargo.Router.MerchantUsers do
  use Maru.Router
  alias Cargo.Repo.MerchantUsers, as: DB
  require Logger

  namespace :users do

    namespace :authenticate do
        @desc "fetch username password for authentication"
        params do
            requires :username, type: String
        end
        post do
            merchant_user = DB.getMerchantUser(params)

            if(length(merchant_user) == 0) do
                conn
                |> send_resp(204, "")
            else
                conn
                |> put_status(200)
                |> json(merchant_user |> List.first)
            end
        end
    end

    namespace :select do
        @desc "get user details from username"
        params do
            requires :username, type: String
        end
        post do
            merchant = DB.getMerchant(params)
            conn
                |> put_status(200)
                |> json(%{:results => merchant})
        end
    end

    namespace :new do
      @desc "add new user"
      params do
        requires :username, type: String
        requires :password, type: String
        requires :licenseNumber, type: String
      end
      post do
        length = DB.getMerchantUserById(params)
        lengthAsJson = Poison.Encoder.encode(length, [])
        merchantUserCount = Poison.decode!(~s(#{lengthAsJson}), as: %MerchantUserCount{})
        exists = merchantUserCount.count > 0
        if (!exists) do
          DB.addMerchantUser(params)
          conn
          |> send_resp(201, "")
        else
          conn
          |> put_status(422)
          |> json(%{:message => "Already signed up"})
        end
      end
    end
  end

end
