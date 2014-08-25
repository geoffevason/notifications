class NotificationPreferencesController < AuthenticatedController
  def index
    @notification_preferences = current_user.notification_preferences
  end

  def update_all
    current_user.notification_types_to_send_email_for = params[:notification_types_to_send_email_for]
    flash[:notice] = "Your preferences have been updated."
    redirect_to action: :index
  end
end
