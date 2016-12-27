defmodule Cargo.Repo.Migrations.AddUniqueConstraintToUser do
  use Ecto.Migration

  def change do
    create unique_index(:merchants_users, [:username])
  end
end
