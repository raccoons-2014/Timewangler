3require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :model do

 context "associations" do
    it { should have_many :games }
  end

end
