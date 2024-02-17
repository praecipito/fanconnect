import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="height"
export default class extends Controller {
  static targets = ['input', 'image']
  connect() {
    console.log(this.inputTarget)
    console.log(this.imageTarget)
  }

  match() {
    this.imageTarget.style.width = `${this.inputTarget.value * 1.75}px`;
  }
}


// const image = document.getElementById('imagem');
// const input = document.querySelector('#height')
// image.style.width = input.value
// input.addEventListener('change', (event) => {
// })
