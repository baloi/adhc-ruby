require 'sequel'

DOCUMENT_DONE = 'D'
NEEDS_DOCUMENT = 'N'
UNKNOWN = '_'


if $TEST == true
  #puts "test == true<----"
  DB = Sequel.connect('sqlite://test.db')
else
  DB = Sequel.connect('sqlite://adhc.db')
end

#doc_codes = {
#    pt_eval_marker:   0,
#    pt_dc_marker:     1,
#    ot_eval_marker:   2,
#    ot_dc_marker:     3,
#    done:             'Y',
#    needs_new:        'N',
#    none_yet:         '_'
#}

class DocumentationStatus
  PT_EVAL_MARKER = 0
  PT_DC_MARKER = 0
  OT_EVAL_MARKER = 0
  OT_EVAL_MARKER = 0
  DONE = 'Y'
  NONE = '_'
  NEEDS_NEW = 'N'

  def initialize
    @code = '____'
  end

  def code
    @code
  end

  def needs_new_pt_eval
    return @code[PT_EVAL_MARKER] == NEEDS_NEW
  end
  def needs_new_pt_eval=(needs_new)
    if needs_new
      @code[PT_EVAL_MARKER] = NEEDS_NEW
    end
  end

  def has_pt_eval=(done) 
    if done
      @code[PT_EVAL_MARKER] = DONE   
    end
  end

  def has_pt_eval
    marker = @code[PT_EVAL_MARKER]
    #puts "marker = #{marker}, done = -->#{DONE}<--"
    if marker == DONE 
      return true
    else
      return false
    end
  end

  def has_no_documentation
    if code == '____'
      return true
    else
      return false
    end
  end
end

class Resident < Sequel::Model
  #def after_initialize
  #  super
  #  self.active ||= true
  #end
  def has_pt_eval=(pt_eval)

  end
end

def create_database
  # remove test database first
  #`rm ~/tinker/adhc/test.db`

  DB.create_table :residents do
    primary_key :id
    String :lastname
    String :firstname
    String :documentation_status
    TrueClass :active
  end
end

def clear_database
  # delete * from residents
  DB[:residents].delete
end

# @@INITIALIZE  run only on first?
#create_database
