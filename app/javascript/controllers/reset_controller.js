import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // NOTE: naming this file 'reset_form_controller' doesn't work. Probably because of underscore between reset and form.
  reset() {
    this.element.reset()
  }


  greet() {
    alert('hello!')
  }
}
