defmodule Bates.Api do
  use Ash.Api

  resources do
    registry Bates.Api.Registry
  end
end
