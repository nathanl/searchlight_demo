module ApplicationHelper

  def menu_link(text, path)
    link_to text, path, class: "#{'active' if current_page?(path)}"
  end
end
