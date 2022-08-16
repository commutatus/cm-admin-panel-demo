class FileImportProcessorJob < ApplicationJob
  queue_as :default

  def perform(self)
    # MarketingSiteManager.deploy
  end
end
