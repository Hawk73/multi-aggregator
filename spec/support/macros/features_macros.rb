module Macros
  module FeaturesMacros
    extend ActiveSupport::Concern

    def expect_have_snippet_with_comments(snippet, comments = nil)
      expect_have_snippet(snippet)

      comments ||= snippet.comments
      comments.each { |comment| expect_have_comment(comment) }
    end

    def expect_have_snippet(snippet)
      expect(page).to have_content(snippet.name)
      expect(page).to have_content(snippet.text)
    end

    def expect_have_comment(comment)
      expect(page).to have_content("#{comment.user.email} commented")
      expect(page).to have_content(comment.text)
    end
  end
end

