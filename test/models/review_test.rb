require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  test "should not save review with negative rating" do
    review = Review.new(rating: -1)
    assert_not review.save, "Saved a review with a negative rating"
  end

  test "should not save review with rating > 5" do
    review = Review.new(rating: 6)
    assert_not review.save, "Saved a review with a rating greater than 5"
  end
  
end