require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :model do
  let(:user) {build(:user)}
  let(:invalid_user) {build(:invalid_user)}

    it "is valid with a username, email address, and password" do
      expect(user).to be_valid
    end

    it "is invalid without a username, email address, or password" do
      expect(invalid_user.valid?).to be false
    end

    it "validates for email addresses" do
      expect(invalid_user.valid?).to be false
    end

 context "associations" do
    xit {  should have_many :matches }
  end


end

