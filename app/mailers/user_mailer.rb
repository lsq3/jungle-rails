class UserMailer < ApplicationMailer

    default from: "no-reply@jungle.com"

    def confirm_order(user, order)
        @user = user
        @order = order
        mail(to: @user.email, subject: "Details of your order #" + @order.id )
    end

end
