base_dir = File.expand_path(File.join(File.dirname(__FILE__), ".."))
lib_dir = File.join(base_dir, "lib")
test_dir = File.join(base_dir, "test")

$LOAD_PATH.unshift(lib_dir)

require 'test/unit'
require 'test/unit/ui/console/testrunner'

class Test::Unit::UI::Console::TestRunner
  def guess_color_availability
    true
  end
end

exit Test::Unit::AutoRunner.run(true, test_dir)
