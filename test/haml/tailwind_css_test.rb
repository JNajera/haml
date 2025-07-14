require 'test_helper'

class TailwindCSSTest < Haml::TestCase
  def test_tailwind_classes_with_slash
    assert_equal(%Q{<p class='text-sm/6'>Lorem ipsum dolor sit amet...</p>\n}, render("%p.text-sm/6 Lorem ipsum dolor sit amet..."))
  end

  def test_tailwind_classes_with_brackets
    assert_equal(%Q{<p class='text-[14px]'>Lorem ipsum dolor sit amet...</p>\n}, render("%p.text-[14px] Lorem ipsum dolor sit amet..."))
  end

  def test_tailwind_classes_with_parentheses
    assert_equal(%Q{<p class='text-(length:--my-text-size)'>Lorem ipsum dolor sit amet...</p>\n}, render("%p.text-(length:--my-text-size) Lorem ipsum dolor sit amet..."))
  end

  def test_multiple_tailwind_classes
    assert_equal(%Q{<div class='text-sm/6 w-[200px]'>Content</div>\n}, render("%div.text-sm/6.w-[200px] Content"))
  end

  def test_tailwind_classes_with_traditional_classes
    assert_equal(%Q{<div class='container text-sm/6'>Content</div>\n}, render("%div.container.text-sm/6 Content"))
  end

  def test_tailwind_classes_with_id
    assert_equal(%Q{<div class='text-sm/6' id='main'>Content</div>\n}, render("%div#main.text-sm/6 Content"))
  end

  def test_div_shorthand_with_tailwind_classes
    assert_equal(%Q{<div class='w-[200px] bg-[#1da1f2]'>Content</div>\n}, render(".w-[200px].bg-[#1da1f2] Content"))
  end

  def test_complex_tailwind_class_combinations
    assert_equal(%Q{<div class='grid-cols-[repeat(auto-fit,minmax(0,1fr))]'>Grid</div>\n}, render(".grid-cols-[repeat(auto-fit,minmax(0,1fr))] Grid"))
  end

  private

  def render(text, options = {})
    scope = self
    eval Haml::Engine.new(options).call(text)
  end
end
