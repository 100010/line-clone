class UserImageUploader < BaseUploader

  def store_dir
    super
    "uploads/user/#{mounted_as}/#{id_partition}/#{model.id}"
  end

  def default_url
    "/img/user/" + [version_name, "default_user_image.jpg"].compact.join('_')
  end

end
