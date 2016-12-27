defmodule Cargo.Repo.Migrations.UpdateMerchantsContactToFloat do
  use Ecto.Migration

  def change do
    alter table(:merchants) do
      modify :contact_number, :float
    end
  end
end
