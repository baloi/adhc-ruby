require './rspec/spec_helper'
require './model'

describe DocumentationStatus do
  it "has a code" do
    doc = DocumentationStatus.new
    doc.code.should_not eq(nil)
  end

  it "can record the need for PT DC"

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
