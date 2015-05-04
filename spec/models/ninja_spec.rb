require 'rails_helper'

RSpec.describe Ninja, type: :model do
  let!(:ninja_with_name){Ninja.new(name: "Stanley")}
  let!(:ninja_with_secret_name){Ninja.new(secret_name: "Jon Hopkins")}

  it "responds to a name" do 
    #Arrange does the name attribute exist? () static classes
    expect(subject).to respond_to(:name)  
  end
    #Act
  it "is invalid without a name" do
    expect(ninja_with_secret_name).to be_invalid
  end
    #Assert {} lazy loading, checks right away
  it "raises an error without a name" do
    expect{ninja_with_secret_name.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end


  it "responds to a secret name" do 
    expect(subject).to respond_to(:secret_name)  
  end

  it "is valid without a secret name" do
    expect(ninja_with_name).to be_invalid
  end

  it "raises an error without a secret name" do
    expect{ninja_with_name.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  # Checks for class method of attack
  describe ".attack" do
    it "responds to attack" do 
      expect(Ninja).to respond_to(:attack)      
    end
  end

  # Checks for instances method of hide
  describe "#hide" do 
    it "responds to hide" do
      expect(subject).to respond_to (:hide)
    end
  end
  
  #
  context "when a Ninja is initialized with a name of Rob" do
    subject(:ninja){Ninja.new(name:"Rob", secret_name: "Ashley")}

    it "should start with three weapons" do
      expect(subject.weapons).to be_an_instance_of(Array)
      expect(subject.weapons.count).to eq(3)
    end

    it "changes to number of Ninja by 1" do
      expect{subject.save!}.to change{Ninja.count}.by(1)
      end

    end

end