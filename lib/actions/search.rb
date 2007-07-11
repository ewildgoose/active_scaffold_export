module ActiveScaffold::Actions
  module Search
    def self.included(base)
      base.before_filter :search_authorized?, :only => :show_search
      base.before_filter :do_search
      base.before_filter :init_session_var
    end
    
    def init_session_var
      session[:search] = params[:search]
    end
  end
end
