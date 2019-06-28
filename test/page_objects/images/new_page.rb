module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images # for failed image creations

      form_for :image do
        element :url
        element :url_error, locator: '.image_url .error'
        element :tag_list
        element :submit_button, locator: '.btn'
      end

      def create_image!(url: nil, tags: nil)
        self.url.set(url) if url.present?
        tag_list.set(tags) if tags.present?
        node.click_button('Create Image')
        window.change_to(ShowPage, self.class)
      end
    end
  end
end
