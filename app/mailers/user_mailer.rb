class UserMailer < ApplicationMailer

	def order_confirmation(user)
    mail(from: "yannis@athanyl.net", to: user.email,
          subject: "Your order confirmation")
   end

end