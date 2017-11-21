require 'test_helper'

class WelcomePageTest < Minitest::Test
  def subject
    WelcomePage.new
  end

  def setup
    visit '/'
  end

  def test_valid
    assert subject.valid?
  end

  def test_without_user_session_render_welcome_page
    assert page.has_content?("wellness doesn't end at 5pm.")
  end

  # def test_load_why_hubbub_link
  #   subject.why_hubbub!
  #   assert page.has_content?('Vibrancy in your employee wellness program')
  # end
end
