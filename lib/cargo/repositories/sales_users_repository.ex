defmodule Cargo.Repo.SalesUsers do
  import Ecto.Query
  require Logger

  def addSalesUser(params) do
    Cargo.Repo.insert! %Cargo.SalesUsers {
        username: params[:username],
        password: params[:password]
    }
  end

  def getSalesUser(params) do
    query = from sales_user in Cargo.SalesUsers,
      select: (
        %{username: sales_user.username, password: sales_user.password}
      ),
      where: field(sales_user, :username) == ^params[:username]

      query |> Cargo.Repo.all
  end

  def getSalesUserByUsername(params) do
    query = from sales_user in Cargo.SalesUsers,
    select: (%{count: count(sales_user.username)}),
    where: field(sales_user, :username) == ^params[:username]
    query
    |> Cargo.Repo.all |> List.first
  end
end