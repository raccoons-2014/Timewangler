require 'rails_helper'
require 'spec_helper'

RSpec.describe DeckCardRelationship, :type => :model do
  describe "associations" do
  	it {should belong_to :card}
  	it {should belong_to :deck}
  end
end
