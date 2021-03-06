class IdeaMailer < ActionMailer::Base

  default_url_options[:host] = HOST

  def notification(user, question, question_id, choice, choice_id)
    setup_email(user)
    @subject += "idea added to question: #{question.the_name}"
    code = Base64.encode64("#{question_id}-#{choice_id}")
    @body[:path] = "foo"
    #@body[:path] = activate_choice_path(:id => code, :only_path => false, :host => @body[:host])
    @body[:question] = question
    @body[:question_id] = question_id
    @body[:choice] = choice
    @body[:choice_id] = choice_id
  end
  
  def notification_for_active(user, question, question_id, choice, choice_id)
    setup_email(user)
    @subject += "idea added to question: #{question.the_name}"
    code = Base64.encode64("#{question_id}-#{choice_id}")
    @body[:path] = "foo"
    #@body[:path] = activate_choice_path(:id => code, :only_path => false, :host => @body[:host])
    @body[:question] = question
    @body[:question_id] = question_id
    @body[:choice] = choice
    @body[:choice_id] = choice_id
  end
  
  protected
    def setup_email(user)
      @recipients  = user.email
      @from        = "info@allourideas.org"
      @subject     = "[All Our Ideas] "
      @sent_on     = Time.now
      @body[:user] = user
      @body[:host] = "www.allourideas.org"
    end

end
