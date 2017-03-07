class UserImageUploader < BaseUploader

  def store_dir
    super
    "uploads/user/#{mounted_as}/#{id_partition}/#{model.id}"
  end

  def default_url
    "/img/item/" + [version_name, "default_item_image.png"].compact.join('_')
  end

end
