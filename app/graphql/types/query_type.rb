Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me

  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :me, Types::UserType do
    description "test user"
    resolve ->(obj, args, ctx) { ctx[:current_user] }
  end

  field :deals, types[Types::DealType] do
    description "test Deal"
    resolve ->(obj, args, ctx) { ctx[:current_user].deals }
  end
end
