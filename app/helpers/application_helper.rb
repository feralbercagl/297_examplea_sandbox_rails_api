module ApplicationHelper
  def icon(icon, options={})
    options = {class: '', large: false}.merge options
    options[:class] = 'fa ' + options[:class].to_s
    options[:class] += ' fa-' + icon
    options[:class] += ' fa-lg' if options[:large] == true
    content_tag :i, '', class: options[:class]
  end
  
  def info_label(text, options={})
    options = {type: :default}.merge options
    options[:class] = 'label ' + options[:class].to_s
    options[:class] += ' label-' + options[:type].to_s if options[:type] != ''
    content_tag :span, text, class: options[:class]
  end
  
  def row(&block)
    content_tag :div, class: 'row' do
      capture &block
    end
  end
  
  def col_md(span, options={}, &block)
    options = {offset: ''}.merge options
    c = "col-md-#{span}"
    c += " col-md-offset-#{options[:offset]}" if options[:offset] != ''
    content_tag :div, class: c do
      capture &block
    end
  end
  
  def btn_submit(form, text)
    form.button :submit, text, disable_with: 'Submitting&hellip;'.html_safe, class: 'btn-primary'
  end
  
  def btn_link_to(text, link_options={}, html_options={})
    html_options = {class: '', type: :default, size: '', pull: ''}.merge html_options
    html_options[:class] = 'btn ' + html_options[:class].to_s
    html_options[:class] += ' btn-' + html_options[:type].to_s if html_options[:type] != ''
    html_options[:class] += ' btn-' + html_options[:size].to_s if html_options[:size] != ''
    html_options[:class] += ' pull-' + html_options[:pull].to_s if html_options[:pull] != ''
    link_to text, link_options, html_options
  end
  
  def panel(options={}, &block)
    options = {heading: '', class: '', type: :default}.merge options
    options[:class] = 'panel ' + options[:class].to_s
    options[:class] += ' panel-' + options[:type].to_s if options[:type] != ''
    content_tag :div, options do
      output = ''.html_safe
      if options[:heading] != ''
        output += content_tag :div, class: 'panel-heading' do
          content_tag :h3, options[:heading], class: 'panel-title'
        end
      end
      output += content_tag :div, class: 'panel-body' do
        capture &block
      end
      output
    end
  end
  
  def nav_tabs(options={}, &block)
    options = {class: ''}.merge options
    options[:class] = 'nav nav-tabs ' + options[:class].to_s
    content_tag :ul, class: options[:class] do
      capture &block
    end
  end
  
  def nav_tab(text, link_options='#', options={})
    options = {class: '', active: false}.merge options
    options[:class] = options[:class].to_s
    options[:class] += ' active' if options[:active] == true
    content_tag :li, class: options[:class] do
      link_to text, link_options
    end
  end
  
  def table(options={}, &block)
    options = {class: '', striped: true, borderd: true, hover: true, condensed: false}.merge options
    options[:class] = 'table ' + options[:class].to_s
    options[:class] += ' table-striped' if options[:striped] == true
    options[:class] += ' table-borderd' if options[:borderd] == true
    options[:class] += ' table-hover' if options[:hover] == true
    options[:class] += ' table-condensed' if options[:condensed] == true
    content_tag :div, class: 'table-responsive' do
      content_tag :table, options do
        capture &block
      end
    end
  end
  
  def thumbnail(image_url, link_options=nil, html_options={}, &block)
    html_options = {class: ''}.merge html_options
    html_options[:class] = 'thumbnail ' + html_options[:class].to_s
    content_tag :div, html_options do
      output = ''.html_safe
      if link_options.nil?
        output += content_tag(:img, nil, src: image_url.html_safe)
      else
        output += link_to url_for(link_options) do
          content_tag(:img, nil, src: image_url.html_safe)
        end
      end
      output += content_tag :div, class: 'caption' do
        capture &block
      end
      output
    end
  end
  
  def swatch(colors=[], html_options={})
    html_options = {class: ''}.merge html_options
    html_options[:class] = 'swatch ' + html_options[:class].to_s
    content_tag :ul, html_options do
      output = ''.html_safe
      colors.each do |color|
        output += content_tag :li, nil, class: 'swatch-color', style: "background-color: #{color};"
      end
      output
    end
  end
  
  def pagination(options={}, &block)
    options = {class: ''}.merge options
    options[:class] = ['pagination', options[:class].to_s].join(' ')
    content_tag :ul, options do
      capture &block
    end
  end
  
  def pagination_link(text, link_options={}, options={})
    options = {class: '', active: false}.merge options
    options[:class] = [options[:active] ? 'active' : '', options[:class].to_s].join(' ')
    content_tag :li, options do
      link_to text, link_options
    end
  end
  
end
