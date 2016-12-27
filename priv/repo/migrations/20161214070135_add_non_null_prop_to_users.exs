defmodule Cargo.Repo.Migrations.AddNonNullPropToUsers do
  use Ecto.Migration

  def change do
    alter table(:merchants_users) do
      modify :username, :string, null: false
      modify :password, :string, null: false
    end
  end
end
