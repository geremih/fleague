class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :latest_match_id

  def latest_match
    @matches = Array(Match.where(completed: nil))
    if @matches.length  == 0
      nil
    else
      @matches.max_by { |m| m.id }
    end
  end
end
