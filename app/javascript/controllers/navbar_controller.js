import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu"]

  expand() {
    this.menuTarget.classList.remove('max-h-0')
    // A height large enough to show the content
    this.menuTarget.classList.add('max-h-40')
  }

  collapse() {
    this.menuTarget.classList.remove('max-h-40')
    this.menuTarget.classList.add('max-h-0')
  }
}