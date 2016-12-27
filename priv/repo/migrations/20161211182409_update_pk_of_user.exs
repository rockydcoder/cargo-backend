defmodule Cargo.Repo.Migrations.UpdatePkOfUser do
  use Ecto.Migration

  def change do
    alter table(:merchants_users) do
      modify :licence_number, :string, primary_key: true
      remove :id
    end
  end
end
