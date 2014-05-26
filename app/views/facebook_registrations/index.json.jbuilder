json.array!(@facebook_registrations) do |facebook_registration|
  json.extract! facebook_registration, :id, :facebook, :facebookId, :name, :email
  json.url facebook_registration_url(facebook_registration, format: :json)
end
