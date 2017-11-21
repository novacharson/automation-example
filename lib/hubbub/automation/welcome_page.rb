class WelcomePage < Capybara::PageMapper::Base
  define_button :why_hubbub, '//a[@title="Why hubbub"]'
  define_button :solution, '//a[@title="Our Solution"]'
  define_button :success, '//a[@title="Success Stories"]'
  define_button :wellness, '//a[@title="Why Wellness"]'
  define_button :news, '//a[@title="News"]'
  define_button :blog, '//a[@title="Wellness Blog"]'
  define_button :app, '//a[@title="Meet the new app"]'

  def why_hubbub!
    why_hubbub_button.trigger('click')
  end

  def solution!
    solution_button.trigger('click')
  end

  def success!
    success_button.trigger('click')
  end

  def wellness!
    wellness_button.trigger('click')
  end

  def blog!
    blog_button.trigger('click')
  end

  def news!
    news_button.trigger('click')
  end

  def app!
    app_button.trigger('click')
  end
end
