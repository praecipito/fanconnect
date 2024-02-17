import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shirt-number"
export default class extends Controller {
  static values = {
    url: String
  }

  static targets = ['wrapper', 'input', 'result', 'submit', 'match', 'card']
  connect() {
    console.log(this.cardTarget);
    console.log(this.urlValue);
  }

  update() {
    this.resultTarget.innerText = this.inputTarget.value
  }

  match() {
    const url = `${this.urlValue}?number=${this.inputTarget.value}`
    fetch(url, {
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        this.wrapperTarget.classList.add('d-none')
        this.cardTarget.classList.remove('d-none')
        this.matchTarget.classList.add('d-none')
        this.submitTarget.classList.remove('d-none')
        this.submitTarget.disabled = false
      })
  }
}
