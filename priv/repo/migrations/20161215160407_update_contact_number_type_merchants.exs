defmodule Cargo.Repo.Migrations.UpdateContactNumberTypeMerchants do
  use Ecto.Migration

  def change do
    alter table(:merchants) do
      remove :contact_number
      add :contact_number, :integer
    end
  end
end
