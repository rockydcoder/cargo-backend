defmodule Cargo.Repo.Migrations.CreateMerchantUsers do
  use Ecto.Migration

  def change do
    create table(:merchants_users) do
      add :username, :string
      add :password, :string
      add :licence_number, references(:merchants, column: :licence_number, type: :string)
    end

  end
end
