// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import LocalTime from 'local-time'

// Overwrite with compact style as twitter
LocalTime.config.i18n.en.time.elapsed = "{time}"
LocalTime.config.i18n.en.time.second = "s"
LocalTime.config.i18n.en.time.seconds = "s"
LocalTime.config.i18n.en.time.minutes = "m"
LocalTime.config.i18n.en.time.minute = "m"
LocalTime.config.i18n.en.time.hours = "h"
LocalTime.config.i18n.en.time.hour = "h"
LocalTime.config.i18n.en.time.singular = "1{time}"
LocalTime.config.i18n.en.time.singularAn = "1{time}"

LocalTime.start()
