import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="height"
export default class extends Controller {
  static targets = ['input', 'image', 'match', 'submit', 'card', 'name', 'result', 'imageCard']
  connect() {
    console.log(this.inputTarget)
    console.log(this.imageCardTarget)
  }

  updateSize() {
    this.imageTarget.style.scale = `${this.inputTarget.value * 1.75}px`;
  }

  match() {
    // fazer fetch
    fetch(`/fan/heights?number=${this.inputTarget.value}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        // esconder match button
        this.matchTarget.classList.add('d-none')
        // ativar botao de submit
        this.submitTarget.classList.remove('d-none')
        this.submitTarget.disabled = false
        // Esconder imagem padrao default
        this.imageTarget.classList.add('d-none')
        this.nameTarget.innerText = data.shirt_name
        // alterar src da imagem
        this.imageCardTarget.setAttribute('src', data.body_image_url)
        this.resultTarget.innerText = `${this.inputTarget.value}cm`
        this.cardTarget.classList.remove('d-none')
      })
  }
}


// const image = document.getElementById('imagem');
// const input = document.querySelector('#height')
// image.style.width = input.value
// input.addEventListener('change', (event) => {
// })
