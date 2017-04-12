class RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      Profile.create(user_id: user.id) if user.id
    end
  end

  protected

  def after_sign_up_path_for(resource)
    if resource.profile
      edit_profile_path(resource.profile)
    else
      super(resource)
    end
  end
end
