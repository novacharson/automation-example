module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end

  def wait_for_selector(selector)
    attempt = 0
    while !page.has_selector?(selector) && attempt < 10
      attempt += 1
      puts "Attempt #{attempt} to find '#{selector}'"
      sleep(1)
    end
    puts "Selector '#{selector}' was found in the #{attempt}"
    true
  end
end
