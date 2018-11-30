class UserMailer < ApplicationMailer

	def order_confirmation(user)
	@u = user
    mail(from: "yannis@athanyl.net", to: @u.email,
          subject: "Your order confirmation")
   end

end