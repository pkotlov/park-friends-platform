json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :facebook_id
  json.url user_url(user, format: :json)
end
