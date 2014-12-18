# http://stackoverflow.com/questions/14972253/simpleform-default-input-class
# https://github.com/plataformatec/simple_form/issues/316

inputs = %w[
  CollectionSelectInput
  DateTimeInput
  FileInput
  GroupedCollectionSelectInput
  NumericInput
  PasswordInput
  RangeInput
  StringInput
  TextInput
]

inputs.each do |input_type|
  superclass = "SimpleForm::Inputs::#{input_type}".constantize

  new_class = Class.new(superclass) do
    def input_html_classes
      super.push('form-control')
    end
  end

  Object.const_set(input_type, new_class)
end

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.boolean_style = :nested
  #config.label_class = 'control-label'
  config.button_class = 'btn'
  
  config.wrappers :bootstrap_basic, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'small', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'small', class: 'help-block muted' }
    end
  end
  
  config.wrappers :bootstrap3, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    
    b.use :min_max
    b.use :maxlength
    b.use :placeholder
    b.optional :pattern
    b.optional :readonly
    
    b.use :label, wrap_with: {tag: 'div', class: 'col-md-3'}
    b.wrapper tag: 'div', class: 'col-md-9' do |input|
      input.use :input
      input.use :hint,  wrap_with: {tag: 'small', class: 'help-block text-muted'}
      input.use :error, wrap_with: {tag: 'small', class: 'help-inline text-danger'}
    end
  end

  config.wrappers :colorpicker, tag: 'div', class: "form-group color", error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, wrap_with: {tag: 'div', class: 'col-md-3'}
    b.wrapper tag: 'div', class: 'col-md-4' do |input|
      input.wrapper tag: 'div', class: 'input-group' do |append|
        append.wrapper tag: 'span', class: 'input-group-addon' do |c|
          c.wrapper tag: 'i' do |d|
          end
        end
        append.use :input, wrap_with: nil
      end
      input.use :error, wrap_with: { tag: 'small', class: 'help-inline' }
      input.use :hint,  wrap_with: { tag: 'small', class: 'help-block muted' }
    end
  end

  config.wrappers :naked_checkbox, tag: 'div', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'div' do |ba|
      ba.use :label_input
      ba.use :error, wrap_with: { tag: 'small', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'small', class: 'help-block muted' }
    end
  end

  config.wrappers :inline_checkbox, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'div', class: 'col-md-9 col-md-offset-3' do |ba|
      ba.use :label_input
      ba.use :error, wrap_with: { tag: 'small', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'small', class: 'help-block muted' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com/)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap3
end
