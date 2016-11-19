defmodule Cargo.Repo.Migrations.CreateActivity do
  use Ecto.Migration

  def change do
    create table(:activities) do
      add :date_of_pickup, :date
      add :date_of_delivery, :date
      add :status, :string
      add :pickup_location, :string
      add :drop_location, :string
      add :payment_ref_no, :string
    end
  end
end
