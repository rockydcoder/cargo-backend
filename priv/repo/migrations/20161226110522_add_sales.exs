defmodule Cargo.Repo.Migrations.AddSales do
  use Ecto.Migration

  def change do
    create table(:sales_users, primary_key: false) do
      add :username, :string, primary_key: true
      add :password, :string
    end
  end
end
