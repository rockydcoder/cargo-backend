defmodule Cargo.Repo.Migrations.AddStatusToMerchants do
  use Ecto.Migration

  def change do
    alter table(:merchants) do
          add :status, :string
        end
  end
end
