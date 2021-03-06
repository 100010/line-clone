class BaseUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{id_partition}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [375, 300]
  end

  version :square do
    process resize_to_fill: [300, 300]
  end

  version :nav_thumb do
    process resize_to_fill: [100,100]
  end

  private def id_partition
    case id = model.id
    when Integer
      ("%09d" % id).scan(/\d{3}/).join("/")
    else
      nil
    end
  end

end
