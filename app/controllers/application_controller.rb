class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "Lisa D Mosman"
    title       = [controller_name, action_name].join(" ")
    description = "Women's boutique in Mosman for Australian and international fashion"
    image       = options[:image] || "https://lh3.googleusercontent.com/UgXx5IrjTmXnTgCs8-xyH14pC7oOODTZ4leckcBnUeC6mIkMjmU2OdiRIBCm2k7aaoOYyf3Mk8Va7-57OElDx5tbRl-ahXwEcE2-1H7XL7rSK_QWdpDuW5mCrOGtmGC-wOtm5ZECcSDI1VlPEbg3S3BK_jh3Ch3mJh04uBBlPRG2MHDSzhBKaFSJ1TJqqk5tloV--SsZfaAo9c0sCo6q3qA2_1-fnnWpXbyqsKN4Wur5q3cIBUnQWES7RkbiGNUuPJvrc5AhcfacGi1bMPg9SMiOe4Z-lvF4-3Gi3qQxS8_d9zZTy6UYCBfZihxCFIEIjx4GBx2W8gxPOrff1_rZHFCpl0skqpLhYlqKpskn1Jy0HHaaSROug32Fta8nVEQ33CWXoMh0jUcs-yY-SWqzDsJCX_NVuI8rtsv485B7263Vdt6iz-7tCHM0jvoxoeQqdkZOgcZRXPM8G2A97GhHmb-7kifkg5nk4u0UnYM_stLZKuaLw8ZPtQhpjcZomYp_OaYufVfaQ99Ug7fbTsAGaznk_xobmyPCkQ1ykTAd03WwDl9IyvubYaLyf7rBxfig3DRxhTE5Hb75opRZ93Dc6VL7jCmfE_BiZPSDAxXmyg394Rfw7x6fQHGqIIZ9VUiw8fRi3jT3NqF-8DPjO2it8NVam9AWksQdZ2AePgcLvbE-Bg=s972-no"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[women fashion clothing mosman shop boutique],
      instagram: {
        site_name: site_name,
        site: '@lisa_d_boutique',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
end
