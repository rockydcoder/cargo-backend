defmodule Cargo.Repo.Migrations.CreateMerchants do
  use Ecto.Migration

  def change do
    create table(:merchants, primary_key: false) do
      add :name_of_company, :string
      add :merchant_name, :string
      add :contact_number, :string
      add :licence_number, :string, primary_key: true
    end

  end
end
