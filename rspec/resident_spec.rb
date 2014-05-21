require './rspec/spec_helper'
require './model'


describe Resident do
  before(:each) do
    clear_database
  end

  after(:each) do
    clear_database
  end

  it "has one or more pt evals"

  it "has documentation status" do
    documentation_status = 'EDED'
    resident = Resident.new
    resident.documentation_status.should eq(nil)
    resident.documentation_status = documentation_status 
    resident.save

    Resident.all.first.documentation_status.should eq(documentation_status)
  end

  it "has documentation status that defaults to nil" do
    resident = Resident.new
    resident.documentation_status.should eq(nil)
    resident.save

    Resident.all.first.documentation_status.should eq(nil)

  end

  it "should be able to create new instance with lastname and firstname" do
    lastname = "Rodriguez"
    firstname = "Charlie"

    resident = Resident.new lastname: lastname, firstname: firstname
    resident.save

    Resident.count.should eq(1)

    r = Resident.all.first
    r.lastname.should eq(lastname)
    r.firstname.should eq(firstname)
  end
  
  it "has a last name" do
    resident = Resident.new
    resident.lastname = "Galos"
    resident.save

    r = Resident.all.first
    r.lastname.should eq('Galos')
  end

  it "can be changed to active" do
    resident = Resident.new
    resident.active = true
    resident.save
  
    resident.active.should eq(true)
    resident.active = false
    resident.save

    r = Resident.all.first
    r.active.should eq(false)
  end
  describe "#document_status" do
    it "has pt eval status" do
      resident = Resident.new
      resident.has_pt_eval = true
      resident.save
  
      Resident.all.count.should eq(1) 
  
    end
  end
end
