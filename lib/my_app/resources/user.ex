# in lib/my_app/resources/user.ex
defmodule MyApp.User do
  use Ash.Resource, data_layer: Ash.DataLayer.Ets

  attributes do
    attribute :email, :string,
      allow_nil?: false,
      constraints: [
        match: ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i
      ]

    uuid_primary_key :id
  end

  actions do
    create :default
    read :default
    update :default
    destroy :default
  end

  relationships do
    has_many :tweets, MyApp.Tweet, destination_field: :user_id
  end
end
