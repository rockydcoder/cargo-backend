defmodule Cargo.Router.Partners do
  use Maru.Router
  alias Cargo.Repo.Partners, as: DB
  require Logger

  namespace :partners do

    @desc "get all partners"
    get do
      partners = DB.getPartners
      conn
      |> put_status(200)
      |> json(partners)
    end

    @desc "get partner by field name"
    params do
      requires :fieldName, type: String
      requires :fieldValue, type: String
    end
    post do
      partners = DB.getPartnersByGenericField(params)
      conn
      |> put_status(200)
      |> json(partners)
    end
  end
end
