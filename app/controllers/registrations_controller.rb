class RegistrationsController < Devise::RegistrationsController
    def create
    super do
      Profile.create(user_id: resource.id)
    end
  end

  protected

  def after_sign_up_path_for(resource)
    edit_profile_path(resource.profile)
  end
end
