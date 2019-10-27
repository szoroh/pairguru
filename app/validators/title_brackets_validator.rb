class TitleBracketsValidator < ActiveModel::Validator
  BRACKETS_MATCH = { '{' => '}', '[' => ']', '(' => ')' }.freeze

  def validate(record)
    stack = Array.new

    record.title.each_char do |char|
      stack << char if BRACKETS_MATCH.key?(char)
      return title_errors(record) if BRACKETS_MATCH.key(char) && BRACKETS_MATCH.key(char) != stack.pop
    end

    return title_errors(record) unless stack.empty?
  end

  private

  def title_errors(record)
    record.errors[:title] << 'has invalid title'
  end
end
