defmodule Cargo.Repo.Migrations.UpdateContactNumberToLong do
  use Ecto.Migration

  def change do
    alter table(:merchants) do
      modify :contact_number, :string
    end
  end
end
