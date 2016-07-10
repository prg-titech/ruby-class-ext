require_relative "testcase"
require "extension_classes"
require_relative "scenarios/scenario3"

class ScopeHierarchyTest < TestCase
	def test_get_enclosing_classes
		assert_equal([Object, S3_A], S3_A::S3_B.__all_enclosing_classes)
	end

	def test_enclosing_are_activated
		assert_equal(:refinement_C_A, S3_A::S3_B.new.call_refinement)
	end
end