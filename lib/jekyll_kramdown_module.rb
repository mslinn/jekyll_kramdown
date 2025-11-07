# See https://mslinn.com/jekyll/10700-designing-for-testability.html
module JekyllKramdownModule
  def self.markdownify(
    markdown_text,
    auto_ids: true,
    input: 'GFM',
    math_engine: 'katex',
    syntax_highlighter: nil
  )
    require 'kramdown'
    require 'kramdown-parser-gfm'
    require 'kramdown-math-katex'

    Kramdown::Document.new(
      markdown_text,
      auto_ids:           auto_ids,
      input:              input,
      math_engine:        math_engine,
      syntax_highlighter: syntax_highlighter
    )
  end
end
