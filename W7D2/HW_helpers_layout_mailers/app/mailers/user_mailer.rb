class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        mail(to: user.email, subject: 'Welcome to 99 Cats Site')
    end
end
