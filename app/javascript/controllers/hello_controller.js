import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log('xxxx')
    this.element.textContent = "Hello World!"
  }
}