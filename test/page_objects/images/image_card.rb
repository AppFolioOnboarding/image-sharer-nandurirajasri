module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      def url
        node.find('img')[:src]
      end

      def tags
        node.all('.tag-link .image-tag').map(&:text)
      end

      def click_tag!(tag_name)
        node.find('.tag-link .image-tag', text: tag_name.to_s).click
        window.change_to(TaggedPage)
      end
    end
  end
end
