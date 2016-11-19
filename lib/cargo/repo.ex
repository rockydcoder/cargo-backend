defmodule Cargo.Repo do
  use Ecto.Repo, otp_app: :cargo
  import Ecto.Query
  require Logger

end
