module Bootstrap
  class Navigation
    include Bootstrap::HtmlBuilder
    
    attr_reader :title, :url
    attr_reader :primary_menu
    attr_reader :secondary_menu
    
    def initialize(title, url='#')
      @title = title
      @url   = url
      yield self if block_given?
    end
    
    def primary(css_class='nav')
      @primary_menu = Menu.new(css_class)
      yield @primary_menu
    end
    
    def secondary(css_class='nav secondary-nav')
      @secondary_menu = Menu.new(css_class)
      yield @secondary_menu
    end
    
    def render
      build_navigation.to_s
    end
    
    def to_s
      render
    end
  end
  
  class Menu
    attr_reader :css_class
    attr_reader :menu_items
    
    def initialize(css_class)
      @css_class  = css_class
      @menu_items = []
      yield self if block_given?
    end
    
    def link(title, url='#')
      @menu_items << MenuItem.new(title, url)
    end
    
    def menu(title, options={})
      item = MenuItem.new(title, '#', options)
      yield item if block_given?
      @menu_items << item
    end
  end
  
  class Separator ; end
  
  class MenuItem
    attr_reader :title, :url
    attr_reader :menu_items
    attr_reader :options
    
    def initialize(title, url, options={})
      @title      = title
      @url        = url
      @menu_items = []
      @options    = options
      
      yield self if block_given?
    end
    
    def menu(title, url='#')
      item = MenuItem.new(title, url)
      @menu_items << item
      yield item if block_given?
    end
    
    def link(title, url='#')
      @menu_items << MenuItem.new(title, url)
    end
    
    def separator
      @menu_items << Separator.new
    end
    
    def has_submenu?
      !@menu_items.empty?
    end
  end
end