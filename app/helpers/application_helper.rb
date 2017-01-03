module ApplicationHelper
  def titre
    base = "Microposts"
    if @titre.nil?
      base
    else
      base + " | " + @titre
    end
  end
end
