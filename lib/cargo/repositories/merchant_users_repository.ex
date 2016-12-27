defmodule Cargo.Repo.MerchantUsers do
  import Ecto.Query
  alias Cargo.Repo.Merchants, as: Merchants
  require Logger

  def getMerchantUser(params) do
    query = from merchant_user in Cargo.MerchantUsers,
    select: (
        %{username: merchant_user.username, password: merchant_user.password, licenseNumber: merchant_user.licence_number}
    ),
    where: field(merchant_user, :username) == ^params[:username]

    query |> Cargo.Repo.all
  end

   def getMerchant(params) do
      query = from merchant in Cargo.MerchantUsers,
      select: (
      %{ licence_number: merchant.licence_number}
      ),
      where: field(merchant, :username) == ^params[:username]

      query |> Cargo.Repo.all |> List.first |> Merchants.getMerchantById
   end

  def addMerchantUser(params) do
    Cargo.Repo.insert! %Cargo.MerchantUsers {
      username: params[:username],
      password: params[:password],
      licence_number: params[:licenseNumber]
    }
  end

  def getMerchantUserById(params) do
    query = from merchant_user in Cargo.MerchantUsers,
    select: (%{ count: count(merchant_user.licence_number)}),
    where: field(merchant_user, :licence_number) == ^params[:licenseNumber]
    query
    |> Cargo.Repo.all |> List.first
  end


end
