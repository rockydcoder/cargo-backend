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
  end
end
