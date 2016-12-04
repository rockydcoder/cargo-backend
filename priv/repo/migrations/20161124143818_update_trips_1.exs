defmodule Cargo.Repo.Migrations.UpdateTrips do
  use Ecto.Migration

  def change do
      rename table(:trips), :price_changed, to: :price_charged
  end
end
