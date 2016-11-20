defmodule Cargo.Repo.Merchants do
  alias Cargo.Repo
  import Ecto.Query
  require Logger

  def getMerchants do
    query = from merchant in Cargo.Merchants,
    select: (
    %{ licence_number: merchant.licence_number, name_of_company: merchant.name_of_company, merchant_name: merchant.merchant_name, contact_number: merchant.contact_number }
    )
    query
    |> Cargo.Repo.all
  end

  def getMercantsByGenericField(params) do
    query = from merchant in Cargo.Merchants,
        select: (
          %{ licence_number: merchant.licence_number, name_of_company: merchant.name_of_company, merchant_name: merchant.merchant_name, contact_number: merchant.contact_number }
        ),
        where: field(merchant, ^String.to_existing_atom(params[:field_name])) == ^params[:field_value]
    query
    |> Cargo.Repo.all
  end

end
