json.array!(@pspaces) do |pspace|
  json.extract! pspace, :id, :address, :latitude, :longitude, :availability, :post_on_facebook, :parked
  json.url pspace_url(pspace, format: :json)
end
