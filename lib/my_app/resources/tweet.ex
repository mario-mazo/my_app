# in lib/my_app/resources/tweet.ex
defmodule MyApp.Tweet do
  use Ash.Resource, data_layer: Ash.DataLayer.Ets

  ets do
    private? true
  end

  attributes do
    uuid_primary_key :id

    attribute :body, :string do
      allow_nil? false
      constraints max_length: 255
    end

    # Alternatively, you can use the keyword list syntax
    # You can also set functional defaults, via passing in a zero
    # argument function or an MFA
    attribute :public, :boolean, allow_nil?: false, default: false

    # This is set on create
    create_timestamp :created_at
    # This is updated on all updates
    update_timestamp :updated_at

    # `create_timestamp` above is just shorthand for:
    # attribute(:created_at, :utc_datetime, writable?: false, default: &DateTime.utc_now/0)
  end

  actions do
    create :default
    read :default
    update :default
    destroy :default
  end

  relationships do
    belongs_to :user, MyApp.User
  end
end
