require './rspec/spec_helper'
require './model'


describe Resident do
  before(:each) do
    clear_database
  end

  after(:each) do
    clear_database
  end

  it "should have a primary PT"
  
  it "should have a primary OT"

  it "should have a note due date"

  it "should be able to identify if the note due date is past"

  it "should have insurance" do
    karpov = Resident.new
    karpov.lastname = "Karpov"
    karpov.insurance = Insurance::MCB
    karpov.save

    kasparov = Resident.new
    kasparov.lastname = "Kasparov"
    kasparov.insurance = Insurance::MCA
    kasparov.save

    has_med_b = Resident.all_insured_by(Insurance::MCB)

    has_med_b.count.should eq(1)
    has_med_b.first.lastname.should eq('Karpov')

    has_med_a = Resident.all_insured_by(Insurance::MCA)

    has_med_a.count.should eq(1)
    has_med_a.first.lastname.should eq("Kasparov")
 
  end

  it "should have a list of days attending" do
    resident = Resident.new
    resident.lastname = "Lopez"
    resident.firstname = "Jaena"
    resident.save
    resident.days_attending.should eq ('')
  end

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
