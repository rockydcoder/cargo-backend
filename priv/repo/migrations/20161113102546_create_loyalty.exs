defmodule Cargo.Repo.Migrations.CreateLoyalty do
  use Ecto.Migration

  def change do
    create table(:loyalties) do
      add :trip_no, :string
      add :coupon_used, :string
    end

  end
end
