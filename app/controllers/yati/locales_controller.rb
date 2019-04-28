module Yati
  class LocalesController < Yati::ApplicationController
    def index
      @locales = Yati::Locale.sort_by(:language_name)
    end

    def show
    end
  end
end
