module ApplicationHelper

  def validation_errors(obj)

    return '' if obj.errors.empty?

    messages = obj.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-danger alert-block"> <a class="close" href="#" data-dismiss="alert">x</a>
     #{messages}
    </div>
    HTML

    html.html_safe

  end

  def show_as_date(datetime)
    datetime.blank? ? "" : datetime.strftime('%B %e, %Y')
  end

  def show_as_datetime(datetime)
    datetime.blank? ? "" : datetime.strftime('%B %e, %Y %l:%M %p')
  end

end
