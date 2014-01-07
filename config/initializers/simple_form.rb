SimpleForm.browser_validations = false

SimpleForm.setup do |config|
  config.input_class = 'form-control'
  config.label_class = 'control-label'

  config.wrappers :bootstrap, tag: 'div', class: 'form-group', error_class: 'error has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label 
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint, wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :prepend, tag: 'div', class: 'form-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label 
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
        prepend.use :input 
      end
      input.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :append, tag: 'div', class: 'form-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input
      end
      input.use :hint, wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :checkbox, tag: :div, class: "checkbox", error_class: 'has_error' do |b|
    b.use :html5
    b.wrapper tag: :label do |ba|
      ba.use :input, class: ''
      ba.use :label_text
    end
    b.use :hint, wrap_with: { tag: :p, class: 'help-block' }
    b.use :error, wrap_with: { tag: :span, class: 'help-block text-danger' }
  end

  config.default_wrapper = :bootstrap
end