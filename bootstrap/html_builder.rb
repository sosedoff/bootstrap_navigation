require 'builder'

module Bootstrap
  module HtmlBuilder
    def build_navigation
      html = Builder::XmlMarkup.new(:indent => 2)
      html.a(self.title, :href => self.url, :class => "brand")
      
      build_section(html, primary_menu) if primary_menu
      build_section(html, secondary_menu) if secondary_menu
    end
    
    def build_section(node, menu)
      node.ul(:class => menu.css_class) { |main_nav|
        menu.menu_items.each do |item|
          if item.has_submenu?
            build_submenu(main_nav, item)
          else
            build_menu(main_nav, item)
          end
        end
      }.to_s
    end
    
    def build_menu(node, item)
      node.li do |li|
        li.a(item.title, :href => item.url)
      end
    end
    
    def build_submenu(node, item)
      node.li(:class => "dropdown", 'data-dropdown' => "dropdown") do |li|
        li.a(item.title, :href => "#", :class => "dropdown-toggle")
        li.ul(:class => "dropdown-menu") do |ul|
          item.menu_items.each do |subitem|
            if subitem.kind_of?(Separator)
              ul.li("", :class => 'divider')
            else
              ul.li do |li|
                li.a(subitem.title, :href => subitem.url)
              end
            end
          end
        end
      end
    end
  end
end