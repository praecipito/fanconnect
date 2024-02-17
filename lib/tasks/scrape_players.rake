namespace :scrape_players do
  desc 'Run scraper form Palmeiras players'
  task run: :environment do
    # Load your file from lib
    require Rails.root.join('lib', 'scraper', 'interface.rb')

    # Call the method or code you want to run
    Interface.run
  end
end
