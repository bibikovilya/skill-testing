class TestingsController < ApplicationController
  require 'capybara'
  require 'capybara/rails'
  require 'capybara/dsl'
  require 'selenium-webdriver'
  require 'capybara/poltergeist'
  #require 'selenium/webdriver'
  #require 'capybara/mechanize'

  include Capybara::DSL

  Capybara.configure do |config|
    config.current_driver = :selenium
    config.javascript_driver = :poltergeist
    config.run_server = false
    config.app_host = 'https://www.elance.com'
    #config.app_host = 'http://demo.tutorialzine.com'
  end

  def index

  end

  def edit
    visit('/')

    page.find('#SignInLnk').click
    fill_in 'login_name', :with => 'JohnSnowNothing'
    fill_in 'passwd', :with => 'bkmz2202'
    page.find('#spr-sign-in-btn-standard').click

    fill_in 'challengeAnswerId', with: 'Риверан'
    #fill_in 'challengeAnswerId', with: 'Винтерфел'
    click_link 'Continue'
    #wait_for_ajax
    sleep 4

    #click_link 'JohnSnowNothing'
    #click_link 'Profile'
    #within '#p-menu' do
    #  click_link 'Skills'
    #end

    visit('/s/edit/johnsnownothing/editSkills/')
    click_link 'Improve Score'
    #page.text.should have_content("Begin Test")
    #wait_until { page.find('h1 .title') }
    #within_frame 'smartererTestingWidgetMasterIFrame' do
    #  wait_for_ajax
    #end
    #sleep 3
    #wait_for_javascript_event 'EOL.smartererTestWidget.modal.Class.update'
    #wait_until_empty 'smartererTestingWidgetMasterIFrame body'

    #browser = page.driver.browser
    #browser.switch_to.frame('smartererTestingWidgetMasterIFrame')
    #wait_for_ajax
    #browser.switch_to.default_content

    @questions = ''

    within_frame 'smartererTestingWidgetMasterIFrame' do
      wait_until_missing '#smartererTestingWidgetResumeTestModalContent'

      click_link 'Begin Test'

      wait_until_empty 'body'

      page.first('#panel_window .choices li').click
      wait_until_missing '#panel_window .correct_answer'

      until page.all('button', text: 'Next Question').empty?
        @questions += page.find('.question.question_text').text
        @questions += ' -> '
        @questions += page.find('#panel_window .correct_answer').text
        @questions += "<br/>"

        click_button 'Next Question'

        wait_until_present '#panel_window .correct_answer'

        page.first('#panel_window .choices li').click
        wait_until_missing '#panel_window .correct_answer'
      end

      click_link 'Done'
    end

    page.find('.eol-dialog-close').click

    render :index
  end

  def new
    visit('/2009/09/simple-ajax-website-jquery/demo.html')

    click_link 'Page 2'
    wait_for_ajax
    click_link 'Page 3'
    wait_for_ajax
    click_link 'Page 4'
    wait_for_ajax

    @page = page.find('#pageContent')

    render :index
  end

  def wait_until_missing selector
    while page.all(selector).empty?
      sleep 0.05
    end
  end

  def wait_until_present selector
    until page.all(selector).empty?
      sleep 0.05
    end
  end

  def wait_until_empty selector
    while page.find(selector).text.empty?
      sleep 0.05
    end
  end

  def wait_for_ajax
    until page.evaluate_script('jQuery.isReady&&jQuery.active==0') do
      sleep 0.05
    end
    #until page.evaluate_script('Ajax.requests.length === 0 && jQuery.active === 0') do
    #  sleep 0.05
    #end
  end

  def wait_for_javascript_event event_name
    selenium_bridge.setScriptTimeout(Capybara.default_wait_time * 1000)

    selenium_driver.execute_async_script(
      "var callback = arguments[arguments.length - 1];
    $(window).one('#{event_name}', function() {setTimeout(callback, 1); return true;});"
    )
  end
end
