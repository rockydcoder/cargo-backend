defmodule Cargo.Repo.Merchants do
  import Ecto.Query
  require Logger

  def getMerchants do
    query = from merchant in Cargo.Merchants,
    select: (
      %{ licenseNumber: merchant.licence_number, companyName: merchant.company_name,
        merchantName: merchant.merchant_name, contactNumber: merchant.contact_number,
        status: merchant.status}
    )
    query
    |> Cargo.Repo.all
  end

  def getMerchants(params) do
    query = from merchant in Cargo.Merchants,
    select: (
      %{ licenseNumber: merchant.licence_number, companyName: merchant.company_name,
        merchantName: merchant.merchant_name, contactNumber: merchant.contact_number,
        status: merchant.status}
    ),
    limit: ^params[:limit],
    offset: ^params[:offset]
    query
    |> Cargo.Repo.all

  end

  def getMerchantsByGenericField(params) do
    query = from merchant in Cargo.Merchants,
        select: (
        %{ licenseNumber: merchant.licence_number, companyName: merchant.company_name,
            merchantName: merchant.merchant_name, contactNumber: merchant.contact_number,
             status: merchant.status}

        ),
        where: field(merchant, ^String.to_existing_atom(params[:fieldName])) == ^params[:fieldValue]
    query
    |> Cargo.Repo.all
  end

  def getMerchantById(params) do
    query = from merchant in Cargo.Merchants,
    select: (%{ count: count(merchant.licence_number)}),
    where: field(merchant, :licence_number) == ^params[:licenseNumber]
    query
    |> Cargo.Repo.all |> List.first
  end

  def addMerchant(params) do
    Cargo.Repo.insert! %Cargo.Merchants {
      company_name: params[:companyName],
      merchant_name: params[:merchantName],
      contact_number: params[:contactNumber],
      licence_number: params[:licenseNumber],
      status: params[:status]
    }
  end

  def updateMerchant(params) do
    changeset = Cargo.Merchants.changeset(
        %Cargo.Merchants{licence_number: params[:licenseNumber]},
        %{status: params[:status]})

    Cargo.Repo.update!(changeset)
  end
end
