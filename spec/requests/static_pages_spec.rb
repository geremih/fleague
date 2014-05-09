require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages/dashboard" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get dashboard_path
      response.status.should be(302)
      #because signin is required
    end
  end
end
