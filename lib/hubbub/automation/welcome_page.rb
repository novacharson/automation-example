class WelcomePage < Capybara::PageMapper::Base
  define_button :why_hubbub, '//a[@title="Why hubbub"]'

  def why_hubbub!
    why_hubbub_button.trigger('click')
  end
end
