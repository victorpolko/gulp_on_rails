module ApplicationHelper
  def gulp_javascript_tag(script_name)
    src =
      if Rails.configuration.gulp[:use_manifest]
        filename = Rails.configuration.gulp[:js_manifest]["#{ script_name }.js"]

        asset_path(filename)
      else
        asset_path("#{ script_name }.js")
      end

    "<script src='#{ src }' type='text/javascript'></script>".html_safe
  end

  def gulp_stylesheet_tag(style_name)
    src =
      if Rails.configuration.gulp[:use_manifest]
        filename = Rails.configuration.gulp[:css_manifest]["#{ style_name }.css"]

        asset_path(filename)
      else
        asset_path("#{ style_name }.css")
      end

    "<link href='#{ src }' rel='stylesheet'>".html_safe
  end

  def favicon_link_tag
    "<link href='#{ asset_path('favicon.ico') }' rel='shortcut icon' type='image/x-icon'>".html_safe
  end


  private

  def asset_path(filename)
    "#{ compute_asset_host }/assets/#{ filename }"
  end
end
