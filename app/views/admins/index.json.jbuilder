json.array!(@admins) do |admin|
  json.extract! admin, :id, :adminname, :password_digest
  json.url admin_url(admin, format: :json)
end
