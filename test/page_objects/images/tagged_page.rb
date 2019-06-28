require File.expand_path(__dir__) + '/image_card.rb'

module PageObjects
  module Images
    class TaggedPage < PageObjects::Document
      path :tagged
      element :new_image_link, locator: 'body a'
      collection :images,
                 locator: '.image-list',
                 item_locator: '.image-display', contains: ImageCard do
      end

      def showing_image?(url:)
        images.any? do |image|
          image.url == url
        end
      end

      def back_to_index!
        node.find('.back-to').click
        window.change_to(IndexPage)
      end
    end
  end
end
