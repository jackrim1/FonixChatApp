require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without email" do
    expect(User.new).to_not be_valid
  end

  describe "associations" do
    it { should have_many(:rooms).through(:memberships) }
  end

end
