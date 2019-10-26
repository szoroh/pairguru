class WeeklyTopCommenters
  def call
    top_commenters
  end

  private

  def top_commenters
    User
      .joins(:comments)
      .group('user_id')
      .where('comments.created_at >= ?', 1.week.ago)
      .order(Arel.sql('count(comments.id) desc'))
      .limit(10)
  end
end
