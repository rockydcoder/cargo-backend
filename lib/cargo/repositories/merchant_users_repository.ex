defmodule Cargo.Repo.MerchantUsers do
  import Ecto.Query
  alias Cargo.Repo.Merchants, as: MerchantRepo
  require Logger

  def getMerchant(params) do
    query = from merchant in Cargo.MerchantUsers,
    select: (
    %{ licence_number: merchant.licence_number}
    ),
    where: field(merchant, :username) == ^params[:username],
    where: field(merchant, :password) == ^params[:password]
    params = query |> Cargo.Repo.all
    MerchantRepo.getMerchantById(List.first(params))
  end

  def addMerchantUser(params) do
    Cargo.Repo.insert! %Cargo.MerchantUsers {
      username: params[:username],
      password: params[:password],
      licence_number: params[:licenseNumber]
    }
  end

end
