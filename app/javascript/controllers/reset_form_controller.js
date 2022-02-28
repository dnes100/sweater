import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // connect() {
  //   console.log('Connected reset form controller to html element')
  // }

  reset() {
    this.element.reset()
  }
}
