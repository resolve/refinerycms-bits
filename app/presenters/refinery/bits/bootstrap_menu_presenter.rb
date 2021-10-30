module Refinery
  module Bits
    class BootstrapMenuPresenter < ::Refinery::Pages::MenuPresenter
      self.selected_css = :active
      private

      def render_menu(items)
        buffer = ActiveSupport::SafeBuffer.new
        buffer << render_menu_items(items, nil)
      end

      def render_menu_items(menu_items, menu_css)
        if menu_items.present?
          if menu_css == 'dropdown-menu'
            content_tag(list_tag, class: menu_css) do
              process_items(menu_items)
            end
          else
            process_items(menu_items)
          end
        end
      end

      def process_items(menu_items)
        buffer = ActiveSupport::SafeBuffer.new
        menu_items.each_with_index.inject(buffer) do |buffer, (item, index)|
          buffer << render_menu_item(item, index)
        end
        buffer
      end

      def render_menu_item(menu_item, index)
        content_tag(list_item_tag, class: menu_item_css(menu_item, index)) do
          buffer = ActiveSupport::SafeBuffer.new
          if menu_item_children(menu_item).present?
            buffer << link_to(menu_item.title, context.refinery.url_for(menu_item.url))
            if menu_item.depth == 0
              buffer << render_menu_items(menu_item_children(menu_item), 'dropdown-menu')
            else
              buffer << content_tag(list_tag) do
                render_menu_items(menu_item_children(menu_item), '')
              end
            end
          else
            buffer << link_to(menu_item.title, context.refinery.url_for(menu_item.url))
          end
          buffer
        end
      end

      def menu_item_css(menu_item, index)
        css = []

        css << selected_css if selected_item_or_descendant_item_selected?(menu_item)
        css << :dropdown if menu_item_children(menu_item).present?

        css.reject(&:blank?).presence
      end

      def selected_item_or_descendant_item_selected?(item)
        selected_item?(item) || descendant_item_selected?(item)
      end

      def selected_item?(item)
        return true if @context.instance_variable_get('@page').id == item.original_id
        super(item)
      end

    end
  end
end
