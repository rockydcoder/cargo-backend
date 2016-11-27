defmodule Cargo.Repo.Loyalties do
  import Ecto.Query
  require Logger

  def getLoyalties do
    query = from loyalty in Cargo.Loyalty,
    select: (
    %{ trip_no: loyalty.trip_no, coupon_used: loyalty.coupon_used }
    )
    query
    |> Cargo.Repo.all
  end

  def getLoyaltiesByGenericField(params) do
    query = from loyalty in Cargo.Loyalty,
        select: (
          %{ trip_no: loyalty.trip_no, coupon_used: loyalty.coupon_used }
        ),
        where: field(loyalty, ^String.to_existing_atom(params[:fieldName])) == ^params[:fieldValue]
    query
    |> Cargo.Repo.all
  end

end
