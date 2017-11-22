class WelcomePage < Capybara::PageMapper::Base
  define_button :why_hubbub, '//a[@title="Why hubbub"]'
  define_button :our_solution, '//li[@class="nav-our-solution nav-current"]/a'

  def our_solution!
    our_solution_button.trigger('click')
  end

  def why_hubbub!
    why_hubbub_button.trigger('click')
  end
end
