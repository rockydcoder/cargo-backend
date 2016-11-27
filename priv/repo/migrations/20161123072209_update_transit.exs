defmodule Cargo.Repo.Migrations.UpdateTransit do
  use Ecto.Migration

  def change do
    alter table(:transits) do
        add :vehicle_name, :string
    end
  end
end
