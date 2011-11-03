# Bootstrap Navigation

This is a simple builder-powered helper to generate bootstrap navigation panel

## Usage

Define navigation panel structure:

```ruby
navigation = Bootstrap::Navigation.new('My Site') do |nav|
  nav.primary do |n|
    n.link 'Dashboard', dashboard_path, :active => true # this will make link active
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

Produced output:

```html
<a href="#" class="brand">My Site</a>
<ul class="nav">
  <li>
    <a href="/dashboard">Dashboard</a>
  </li>
  <li class="dropdown" data-dropdown="dropdown">
    <a href="#" class="dropdown-toggle">Dropdown Menu</a>
    <ul class="dropdown-menu">
      <li>
        <a href="/hello/world">Submenu 1</a>
      </li>
      <li>
        <a href="path_to_your_stuff">Submenu 2</a>
      </li>
      <li>
        <a href="#">Submenu 3</a>
      </li>
      <li class="divider"></li>
      <li>
        <a href="http://yourstuff.com">Another item</a>
      </li>
    </ul>
  </li>
</ul>
<ul class="nav secondary-nav">
  <li class="dropdown" data-dropdown="dropdown">
    <a href="#" class="dropdown-toggle">Currrent User</a>
    <ul class="dropdown-menu">
      <li>
        <a href="#">Link 1</a>
      </li>
      <li>
        <a href="#">Link 2</a>
      </li>
      <li class="divider"></li>
      <li>
        <a href="#">Logout</a>
      </li>
    </ul>
  </li>
</ul>
```