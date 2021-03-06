class Contest < ActiveRecord::Base
  belongs_to :account
  belongs_to :order
  validates_presence_of :name
  def criteria
    results = []
    results << "Product Name: #{product_name}" if
    product_name.present?
    results << "Start Date: #{I18n.l start_date.to_date,
    format: :short}" if start_date.present?
    results << "End Date: #{I18n.l end_date.to_date,
    format: :short}" if end_date.present?
    results << "Max #: #{max_results}" if
    max_results.present?
    return results.join(', ')
  end
  # This method creates a Contest and returns
# the winner(s) in the notice message
  def create_contest
    @contest = Contest.new(contest_params)
    # Store the name of the product for easier readability
    @contest.product_name = Product.find_by_shopify_product_
    id(contest_params[:product_id]).try(:name) if contest_
    params[:product_id].present?
    respond_to do |format|
      if @contest.save
      # Pick a winner
      candidates = Order.candidate_list(params)
      contest_results = ContestResults.new(candidates)
      # Save the winner
      @contest.update_attribute(:order_id,
      contest_results.results)
      format.html { redirect_to root_path, notice: "Contest Winner: <a href='#{order_path(@contest.order)}'>#{@contest.order.email}</a>" }
      format.json { render action: 'show', status: :created,
      location: @contest }
      else
      format.html { redirect_to root_path, alert: "Unable to
      create a Contest" }
      format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def contest_params
    params.require(:contest).permit(:name, :product_id, :start_date, :end_date, :max_results, :order_id)
  end
end
