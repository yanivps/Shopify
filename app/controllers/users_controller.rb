class UsersController < ApplicationController
	def update
		if current_user.update_attributes(user_params)
			flash[:notice] = "השינויים עודכנו בהצלחה."
		else
			flash[:error] = "העדכון נכשל."
		end
		redirect_to edit_user_registration_path
	end

	private

	def user_params
		params.require(:user).permit(:name, :email_notifications)
	end
end
