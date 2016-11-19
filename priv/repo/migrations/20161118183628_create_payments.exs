defmodule Cargo.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments, primary_key: false) do
      add :payment_mode, :string
      add :payment_status, :string
      add :payment_ref_no, :string, primary_key: true
      add :gross_amount, :float
      add :paid_amount, :float
      add :net_amount, :float
    end
  end
end
