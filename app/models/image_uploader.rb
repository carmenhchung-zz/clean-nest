class ImageUploader < Shrine
  plugin :processing
  plugin :versions

  Attacher.validate do
    validate_max_size 4.megabyte, message: "is too large (max is 4 MB)"
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png']
  end

  plugin :remove_attachment
  plugin :delete_raw
  # Remove and delete photos if they are deleted.
end
