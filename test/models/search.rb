require "test_helper"

class SearchTest < ActiveSupport::TestCase
  test "questions can be found by title" do
    results = Search.perform('why')

    assert_equal 1, results.size
    assert_equal questions(:first).id, results.first.id
  end

  test "questions can be found by body" do
    results = Search.perform('explain')

    assert_equal 1, results.size
    assert_equal questions(:first).id, results.first.id
  end

  test "questions can be found by answer" do
    results = Search.perform('blue')
    result_ids = results.collect(&:id)

    assert_equal 2, results.size
    
    assert result_ids.include? questions(:first).id
    assert result_ids.include? questions(:second).id
    assert all.all? { |result| result.is_a?(Question) }
  end

end