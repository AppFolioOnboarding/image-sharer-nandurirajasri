module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      def image_url
        node.find('img')[:src]
      end

      def tags
        node.find('.tag_list').text
      end

      def go_back_to_index!
        node.find('.back-to').click
        window.change_to(IndexPage)
      end
    end
  end
end
