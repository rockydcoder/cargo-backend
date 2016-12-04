defmodule Cargo.Repo.Merchants do
  import Ecto.Query
  require Logger

  def getMerchants do
    query = from merchant in Cargo.Merchants,
    select: (
      %{ licenseNumber: merchant.licence_number, companyName: merchant.company_name, merchantName: merchant.merchant_name, contactNumber: merchant.contact_number }
    )
    query
    |> Cargo.Repo.all
  end

  def getMercantsByGenericField(params) do
    query = from merchant in Cargo.Merchants,
        select: (
        %{ licenseNumber: merchant.licence_number, companyName: merchant.company_name, merchantName: merchant.merchant_name, contactNumber: merchant.contact_number }

        ),
        where: field(merchant, ^String.to_existing_atom(params[:fieldName])) == ^params[:fieldValue]
    query
    |> Cargo.Repo.all
  end

  def getMerchantById(params) do
    query = from merchant in Cargo.Merchants,
    select: (
    %{ licenseNumber: merchant.licence_number, companyName: merchant.company_name, merchantName: merchant.merchant_name, contactNumber: merchant.contact_number }
    ),
    where: field(merchant, :licence_number) == ^params[:licence_number]
    query
    |> Cargo.Repo.all
  end

  def addMerchant(params) do
    Cargo.Repo.insert! %Cargo.Merchants {
      company_name: params[:companyName],
      merchant_name: params[:merchantName],
      contact_number: params[:contactNumber],
      licence_number: params[:licenseNumber]

    }
  end

end
