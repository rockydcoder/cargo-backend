defmodule Cargo.Router.Merchants do
  use Maru.Router
  alias Cargo.Repo.Merchants, as: DB
  require Logger

  namespace :merchants do

    namespace :all do
      @desc "get all merchants"
      get do
          merchants = DB.getMerchants
          conn
          |> put_status(200)
          |> json(%{:results => merchants})
       end

       @desc "get merchants with limit-range"
       params do
         requires :limit, type: Integer
         requires :offset, type: Integer
       end
       post do
         merchants = DB.getMerchants(params)
         conn
         |> put_status(200)
         |> json(%{:results => merchants})
       end
    end


    namespace :select do
          @desc "get merchant by field name"
          params do
            requires :fieldName, type: String
            requires :fieldValue, type: String
          end
          post do
            merchants = DB.getMerchantsByGenericField(params)
            conn
            |> put_status(200)
            |> json(%{:results => merchants})
          end
    end

    namespace :new do
      @desc "add a new merchant"
      params do
        requires :merchantName, type: String
        requires :companyName, type: String
        requires :contactNumber, type: String
        requires :licenseNumber, type: String
        requires :status, type: String
      end
      post do
        length = DB.getMerchantById(params)
        lengthAsJson = Poison.Encoder.encode(length, [])
        merchantCount = Poison.decode!(~s(#{lengthAsJson}), as: %MerchantUserCount{})
        exists = merchantCount.count > 0
        if(!exists) do
          DB.addMerchant(params)
          conn
          |> put_status(200)
          |> json(params)
        else
          conn
          |> put_status(422)
          |> json(%{:message => "License number already registered"})
        end
      end
    end

    namespace :update do
      @desc "update merchant status"
      params do
        requires :licenseNumber, type: String
        requires :status, type: String
      end

      post do
        DB.updateMerchant(params)
        conn
        |> send_resp(202, "")
      end
    end

  end


end
