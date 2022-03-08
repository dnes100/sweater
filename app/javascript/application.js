// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import LocalTime from 'local-time'
import Swal from 'sweetalert2'

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



// Note: Override turbo confirm dialog (eg: data-turbo-confirm="Confirm?")
//   Swal.fire returns a promise which hasn't been handled in turbo.js yet
//   so we need to add 'await' keyword to 'start' function in turbo.js:
//   app/assets/javascripts/turbo.js in turbo-rails gem source
//   const answer = await FormSubmission.confirmMethod(this.confirmationMessage, this.formElement);
//    Also pin to turbo.js instead of turbo.min.js in config/importmap.rb
Turbo.setConfirmMethod(
  async (message, htmlElement) => {
    const ret = await Swal.fire({
      title: 'Confirm',
      text: message,
      icon: 'question',
      showCancelButton: true,
    })

    return ret.isConfirmed
  }
)
