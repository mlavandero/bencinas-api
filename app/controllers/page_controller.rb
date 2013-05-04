class PageController < ApplicationController
  caches_page :home

  def home
  end
end
