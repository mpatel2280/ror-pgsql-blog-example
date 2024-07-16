require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should not save post without title" do
    post = Post.new(content: "post content!")
    assert_not post.save, "Saved the post without title"
  end

end
