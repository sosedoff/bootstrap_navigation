# Bootstrap Navigation

This is a simple builder-powered helper to generate bootstrap navigation panel

## Usage

Define navigation panel structure:

```ruby
navigation = Bootstrap::Navigation.new('My Site') do |nav|
  nav.primary do |n|
    n.link 'Dashboard', dashboard_path
    n.menu 'Dropdown Menu' do |m|
      m.link 'Submenu 1', '/hello/world'
      m.link 'Submenu 2', path_to_your_stuff
      m.link 'Submenu 3' # will insert '#' as href
      m.separator
      m.link 'Another item', "http://yourstuff.com"
    end
  end
  
  nav.secondary do |n|
    n.menu 'Currrent User' do |m|
      m.link 'Link 1'
      m.link 'Link 2'
      m.separator
      m.link 'Logout'
    end
  end
end
```

Render that:

```ruby
# Plain ruby
navigation.render

# In rails
navigation.render.html_safe
```