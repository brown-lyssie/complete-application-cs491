defmodule GameLibrary.Repo do
  use Ecto.Repo,
    otp_app: :game_library,
    adapter: Ecto.Adapters.Postgres
end
