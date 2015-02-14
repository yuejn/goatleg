# encoding: utf-8
class AttachmentUploader < CarrierWave::Uploader::Base

include CarrierWave::MiniMagick # for resizing purposes
storage :fog # using AWS

    def store_dir
        "gl/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    version :preview do
        process :resize_to_fit => [256,256]
    end

end