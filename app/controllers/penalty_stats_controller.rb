class PenaltyStatsController < ApplicationController

#before_action :confirm_logged_in
before_action :confirm_admin, :only => [:edit, :create, :update, :delete]

end
