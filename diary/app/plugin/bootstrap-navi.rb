# Show navi for twitter-bootstrap theme
#
# Copyright (c) KAOD Masanori <kdmsnr at gmail.com>
# You can redistribute it and/or modify it under GPL.

def bootstrap_navi(options = {})
  default_options = {
    :navbar_class => 'navbar-inverse',
    :site_name? => true,
    :search_form? => true
  }
  options = default_options.merge(options)

  body = ""
  body += <<-EOS
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
  EOS
  if options[:site_name?]
    body += <<-EOS
      <a class="navbar-brand visible-xs" href="#{@conf.index}">#{h @conf.html_title}</a>
    EOS
  end
  body += <<-EOS
    </div>
  EOS

  body += <<-EOS
    <div id="navbar" class="collapse navbar-collapse">
  EOS

  body += <<-EOS
      <ul class="nav navbar-nav navbar-left">
        #{navi_user.gsub(/span/, "li")}
        #{navi_admin.gsub(/span/, "li")}
      </ul>
  EOS

  if options[:search_form?]
    body += <<-EOS
      <form class="navbar-form navbar-right"
        method="get" action="https://www.google.co.jp/search"
        onsubmit="$('#sitesearch').val($(location).attr('host')+$(location).attr('pathname'))">
        <input type="hidden" name="ie" value="UTF8">
        <input type="hidden" name="oe" value="UTF8">
        <input type="hidden" name="sitesearch" id="sitesearch">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="キーワード検索" name="q">
        </div>
      </form>
    EOS
  end

  body += <<-EOS
    </div>
  EOS

  <<-EOS
<nav class="navbar #{options[:navbar_class]} navbar-fixed-top">
  <div class="container">
    #{body}
  </div>
</nav>
EOS
end

add_header_proc do
  %Q|<meta name="viewport" content="width=device-width, initial-scale=1.0">|
end
