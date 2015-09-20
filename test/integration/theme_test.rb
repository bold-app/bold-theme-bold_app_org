require 'test_helper'

class ThemeTest < ThemeIntegrationTest

  setup do
    setup_site 'bold_app_org'
  end

  test 'should have special pages' do
    check_special_pages except: %w(archive_page author_page tag_page category_page)
  end

  test 'should show homepage' do
    check_home_page
  end

  test 'should show page' do
    check_shows_page
  end

end
