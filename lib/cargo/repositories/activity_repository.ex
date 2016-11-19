defmodule Cargo.Repo.Activities do
  alias Cargo.Repo
  import Ecto.Query
  require Logger

  def getActivities do
    query = from activity in Cargo.Activity,
      select: (
        %{ date_of_pickup: activity.date_of_pickup,  date_of_delivery: activity.date_of_delivery, status: activity.status, pickup_location: activity.pickup_location, drop_location: activity.drop_location, payment_ref_no: activity.payment_ref_no }
      )
      query |> Cargo.Repo.all
  end

  def getActivitiesByGenericField(params) do
    query = from activity in Cargo.Activity,
        select: (
            %{ date_of_pickup: activity.date_of_pickup,  date_of_delivery: activity.date_of_delivery, status: activity.status, pickup_location: activity.pickup_location, drop_location: activity.drop_location, payment_ref_no: activity.payment_ref_no }
        ),
        where: field(activity, ^String.to_existing_atom(params[:field_name])) == ^params[:field_value]
    query
    |> Cargo.Repo.all
  end

end
