# frozen_string_literal: true

require 'i18n'

# Setup i18n
I18n.load_path += Dir['config/locales/*.yml']
I18n.default_locale = :en

