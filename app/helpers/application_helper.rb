module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def avatar_url_small(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}?s=20&d=mm"
  end

  def avatar_url_big(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}?s=200&d=mm"
  end

  def avatar_url(user, size, force="n")
    if user
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    else
      gravatar_id = Digest::MD5::hexdigest("user@example.com").downcase
    end
    "http://gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm&f=#{force}"
  end    

end
