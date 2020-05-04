defmodule MediChat.Repo do
  use Ecto.Repo,
    otp_app: :medi_chat,
    adapter: Ecto.Adapters.MyXQL
end
