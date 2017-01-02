json.session do
	# 返回id name admin token
  json.(@user, :id, :name, :admin)
  json.token @user.authentication_token
end