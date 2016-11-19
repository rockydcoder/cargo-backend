defmodule Cargo.Repo.Migrations.AddForeignKeyToActivities do
  use Ecto.Migration

  def change do
    alter table (:activities) do
      modify :payment_ref_no, references(:payments, column: :payment_ref_no, type: :string)
    end
  end
end
