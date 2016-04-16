class DashboardController < ApplicationController
  def index
    # Load past results in reverse order
    @contests = Contest.order("created_at desc")
    # Instantiate a new Contest so the form loads properly
    @contest = Contest.new
  end
end
