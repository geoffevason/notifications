# Create an admin user based on secrets.yml
class CreateAdminService
  def call
    admin_email = Rails.application.secrets.admin_email
    return if admin_email.blank?

    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email)

    return unless user.exists?
    user.password = Rails.application.secrets.admin_password
    user.password_confirmation = Rails.application.secrets.admin_password
  end
end
