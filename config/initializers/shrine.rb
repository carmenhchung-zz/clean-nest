require "cloudinary"
require "shrine/storage/cloudinary"

Shrine.plugin :activerecord
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :validation_helpers

Cloudinary.config(
  cloud_name: "carmenhchung",
  api_key: ENV["CLOUDINARY_KEY"],
  api_secret: ENV["CLOUDINARY_SECRET"]
)


Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "store"),
}
