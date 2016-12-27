defmodule Cargo.Router.SalesUsers do
  use Maru.Router
  alias Cargo.Repo.SalesUsers, as: DB
  require Logger

  namespace :sales do

    namespace :authenticate do
        @desc "fetch username password for authentication"
        params do
            requires :username, type: String
        end

        post do
          sales_user = DB.getSalesUser(params)

          if (length(sales_user) == 0) do
            conn
            |> send_resp(204, "")
          else
            conn
            |> put_status(200)
            |> json(sales_user |> List.first)
          end
        end
    end

    namespace :new do
      @desc "add a salesperson"
      params do
        requires :username, type: String
        requires :password, type: String
      end

      post do
        length = DB.getSalesUserByUsername(params)
        lengthAsJson = Poison.Encoder.encode(length, [])
        salesUserCount = Poison.decode!(~s(#{lengthAsJson}))
        exists = salesUserCount.count > 0
        if (!exists) do
          DB.addSalesUser(params)
          conn
          |> send_resp(201, "")
        else
          conn
          |> put_status(422)
          |> json(%{:message => "Account exists"})
        end
      end

    end
  end
end