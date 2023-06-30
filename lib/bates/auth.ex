defmodule Bates.Auth do
  use Ash.Api

  resources do
    registry Bates.Auth.Registry
  end
end
