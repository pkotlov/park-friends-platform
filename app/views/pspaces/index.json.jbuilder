json.array!(@pspaces) do |pspace|
  json.(pspace, :id, :address, :latitude, :longitude, :availability, :post_on_facebook, :parked)
  json.actuality pspace.actuality
  json.url pspace_url(pspace, format: :json)
end
