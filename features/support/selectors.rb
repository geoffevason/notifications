# features/support/selectors.rb
module HtmlSelectorsHelpers
  # Maps a name to a selector. Used primarily by the
  #
  # When /^(.+) within (.+)$/ do |step, scope|
  def selector_for(locator)
    case locator

    when "the feed"
      "#feed"

    when "the post"
      "##{html_id(@post)}"

    when "the comment"
      "##{html_id(@comment)}"

    when "the comments for the post"
      "##{html_id(@post)} .comments"
      
    when "the notifications area"
      "#notifications"

    when /^"(.+)"$/
      $1

    else
      fail "Can't find mapping from \"#{locator}\" to a selector.\n" \
            "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(HtmlSelectorsHelpers)
