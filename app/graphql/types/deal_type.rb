module Types
  DealType = GraphQL::ObjectType.define do
    name "Deal"
    description "deal description"

    field :id, !types.Int
    field :title, !types.String
    field :title, !types.String do
      resolve -> (obj, args, ctx) { obj.user.email.split("@")[0] + '-' + obj.title}
    end

    field :user, !UserType
  end
end
