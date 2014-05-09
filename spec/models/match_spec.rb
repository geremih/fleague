require 'spec_helper'

describe Match do
  
  before {@match = Match.new}
  subject { @match}

  it{ should respond_to(:completed)}
  it{ should respond_to(:players)}

  describe "when total players not 11" do
    it { should_not be_valid}
  end

end
