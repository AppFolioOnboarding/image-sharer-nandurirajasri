require File.expand_path(__dir__) + '/image_card.rb'

module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images
      path :image
      element :new_image_link, locator: 'body a'
      collection :images,
                 locator: '.image-list',
                 item_locator: '.image-display', contains: ImageCard do
        def delete
          node.find('.delete-link').click
          yield Capybara.current_session.driver.browser.switch_to.alert
        end
      end

      def add_new_image!
        new_image_link.node.click
        window.change_to(NewPage)
      end

      def showing_image?(url:)
        images.any? do |image|
          image.url == url
        end
      end
    end
  end
end
