import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shirt-number"
export default class extends Controller {
  static values = {
    url: String
  }

  static targets = ['wrapper', 'input', 'result', 'submit', 'match', 'card', 'image', 'name', 'position']
  connect() {
    console.log(this.urlValue);
  }

  update() {
  }

  match() {
    const url = `${this.urlValue}?number=${this.inputTarget.value}`
    fetch(url, {
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        // hide inputs and display fifa card
        this.wrapperTarget.classList.add('d-none')
        this.cardTarget.classList.remove('d-none')
        this.matchTarget.classList.add('d-none')
        this.submitTarget.classList.remove('d-none')
        this.submitTarget.disabled = false

        // update card info
        this.resultTarget.innerText = this.inputTarget.value
        this.nameTarget.textContent = data.shirt_name
        this.positionTarget.textContent = this.abbreviatePosition(data.position)
        this.imageTarget.setAttribute('src', data.upper_image_url)
      })
  }

  abbreviatePosition(name) {
    const positions = {
      'Goleiro': 'GK',
      'Lateral-Direito': 'LD',
      'Lateral-Esquerdo': 'LE',
      'Zagueiro': 'ZAG',
      'Meio-Campista': 'MC',
      'Atacante': 'AT',
      'Técnico': 'TEC'
    }

    return positions[name]
  }
}
