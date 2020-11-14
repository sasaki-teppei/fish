class ApplicationMailer < ActionMailer::Base
  default :from => 'any_from_address@example.com'
  
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
          :subject => '振り込み依頼の件について' 
        )
  end
end
