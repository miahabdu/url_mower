class Link < ActiveRecord::Base
  after_create :generate_slug#, :screenshot_scrape
  mount_uploader :screenshot, ScreenshotUploader

  def display_slug
    if Rails.env.production?
      'http://urlmower.com/' + self.slug
    else
      'http://localhost:3000/' + self.slug
    end
  end
  
  def generate_slug
    self.slug = self.id.to_s(36)
    self.save
  end

  def screenshot_scrape
    ScreenshotWorker.perform_async(self.id)
    ScrapeWorker.perform_async(self.id)
  end
end
