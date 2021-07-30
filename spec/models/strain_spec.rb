require 'rails_helper'

RSpec.describe Strain, type: :model do

  before { Strain.create!(name: "Merlot") }
  it "is not valid with the same strain name" do
    strain = Strain.create(name: "Merlot")
    expect(strain).to_not be_valid
  end

  it "is not valid with nil strain name" do
    strain = Strain.create(name: nil)
    expect(strain).to_not be_valid
  end

  it "is not valid without a strain name" do
    strain = Strain.create(name: "")
    expect(strain).to_not be_valid
  end

  it "is valid with a strain name" do
    strain = Strain.create(name: "Carmenere")
    expect(strain).to be_valid
  end

end
