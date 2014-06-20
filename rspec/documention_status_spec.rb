require './rspec/spec_helper'
require './model'

describe PTEval do

  before(:each) do
    clear_database
  end

  after(:each) do
    clear_database
  end


  it "has a date" do
    pt_eval = PTEval.new
    pt_eval.date_done = Date.today
    pt_eval.save
    
    pe = PTEval.all.first
    #puts "-->>#{pe.date_done}<<--"
    pe.date_done.should eq(Date.today)
  end

  it "has a resident" do
    pt_eval = PTEval.new
    pt_eval.date_done = Date.today
    pt_eval.save
 
    resident = Resident.new
    resident.lastname = "Tudor"
    resident.save

    pt_eval.resident_id = resident.id
    pt_eval.save

    pt_eval.resident.lastname.should eq('Tudor') 
  end
end

describe DocumentationStatus do

  before(:each) do
    clear_database
  end

  after(:each) do
    clear_database
  end


  it "has a code" do
    doc = DocumentationStatus.new
    doc.code.should_not eq(nil)
  end

  #describe "#new_pt_eval_on(date)" do
  #  it "should set PT_DC_STATUS to NONE"
  #end

  describe "#pt_dc_status" do
    it "is none at the beginning" do
      doc = DocumentationStatus.new
      doc.pt_dc_status.should eq(DocumentationStatus::NONE)     
    end
   
    it "should be done if there is an UP-TO-DATE d/c" do
      doc = DocumentationStatus.new
      doc.pt_dc_done=true
    end
  end

  it "can record the status of OT eval" do
    doc = DocumentationStatus.new
    doc.has_ot_eval.should eq(false)
    doc.has_ot_eval = true
    doc.has_ot_eval.should eq(true)
    doc.needs_new_ot_eval = true
    doc.needs_new_ot_eval.should eq(true)
   
  end

  it "can record the status of PT eval" do
    doc = DocumentationStatus.new
    doc.has_pt_eval.should eq(false)
    doc.has_pt_eval = true
    doc.has_pt_eval.should eq(true)
    doc.needs_new_pt_eval = true
    doc.needs_new_pt_eval.should eq(true)
  end

  describe "#code" do
    it "should be initialized at '____'" do
      doc = DocumentationStatus.new
      doc.code.should eq('____')
    end

    it "has no documentation done at the start" do
      doc = DocumentationStatus.new
      doc.has_no_documentation.should eq(true) 
    end

  end
end
