class WelcomeController < ApplicationController
  before_action :prepare_meta_tags, if: "request.get?"
  def index
    prepare_meta_tags description: t('meta.description')
  end

  def download
  end

  def introduce
  end

  def qa
  end

  def contact
  end

  def google_verify
  end

  private

  def prepare_meta_tags(options={})
    site_name   = t('meta.site_name')
    title       = t('meta.title')
    current_url = request.url
    defaults = {
        site:        site_name,
        title:       title,
        canonical:   current_url
    }
    options.reverse_merge!(defaults)
    set_meta_tags options
  end
end
