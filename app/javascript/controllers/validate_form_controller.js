import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  onInput() {
    const button = this.element.closest('form').querySelector('input[name="commit"]')
    const isEmpty = this.element.value.length === 0
    const isDisabled = button.hasAttribute('disabled')

    if (isEmpty && !isDisabled) {
      button.setAttribute('disabled', true)
      return
    }

    if (!isEmpty && isDisabled) {
      button.removeAttribute('disabled')
      return
    }
  }
}
