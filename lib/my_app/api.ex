# lib/my_app/api.ex
defmodule MyApp.Api do
  use Ash.Api

  resources do
    resource MyApp.User
    resource MyApp.Tweet
  end
end
