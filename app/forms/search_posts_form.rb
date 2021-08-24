class SearchPostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :body, :string
  attribute :description, :string
  attribute :username, :string

  def search
    scope = Post.distinct
    scope = splited_bodies.map { |splited_body| scope.body_contain(splited_body) }.inject { |result, scp| result.or(scp) } if description.present?
    scope = scope.comment_body_contain(body) if body.present?
    scope = scope.username_contain(username) if username.present?
    scope
  end

  private

  def splited_bodies
    description.strip.split(/[[:blank:]]+/)
  end
end