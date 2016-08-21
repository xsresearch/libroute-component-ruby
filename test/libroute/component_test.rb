require 'test_helper'

class Libroute::ComponentTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Libroute::Component::VERSION
  end

  def test_it_does_something_useful

    t = Thread.new {
      ::Libroute::Component.run('localhost'){|s| s.reverse}
    }

    sleep 1

    result = `echo -n "abcdef" | ncat localhost 2000`
    result = result[0..5]
    assert_equal('fedcba', result, "Returned value '#{result}' should be 'fedcba'")

    t.terminate

    assert true
  end
end
