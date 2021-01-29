// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source", "button" ]
  copy() {
    this.sourceTarget.select()
    document.execCommand("copy")
    this.buttonTarget.textContent = 'Copied'

    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.buttonTarget.textContent = 'Copy'
      this.sourceTarget.blur()
    }, 1000)
  }
}
