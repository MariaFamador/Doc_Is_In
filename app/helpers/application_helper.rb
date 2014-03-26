module ApplicationHelper
  def activating_nav(text_label, path, **options)
    status = current_page?(path) ? "active" : nil
    content_tag :li, class: status do
      link_to text_label, path, options
    end
  end
end
