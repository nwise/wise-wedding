ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  errors = Array(instance.error_message).join(',')
  %(#{html_tag}<span class="help-inline error">&nbsp;#{errors}</span>).html_safe
end