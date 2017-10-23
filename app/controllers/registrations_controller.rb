# Override the Devise requirement to enter your current password whenever you edit your profile.
class RegistrationsController < Devise::RegistrationsController
  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
