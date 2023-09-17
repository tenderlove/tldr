require "test_helper"

class ExitCodeTest < Minitest::Test
  def test_success
    result = TLDRunner.should_succeed("success.rb")

    assert_equal "", result.stderr
    assert_equal 0, result.exit_code
    assert_includes result.stdout, "💯"
  end

  def test_failure
    result = TLDRunner.should_fail("fail.rb")

    assert_equal "🙏", result.stderr
    assert_equal 1, result.exit_code
  end

  def test_error
    result = TLDRunner.should_fail("error.rb")

    assert_equal "😬", result.stderr
    assert_equal 2, result.exit_code
  end

  def test_skip
    result = TLDRunner.should_succeed("skip.rb")

    assert_equal "", result.stderr
    assert_equal 0, result.exit_code
    assert_includes result.stdout, "🫥"
  end
end