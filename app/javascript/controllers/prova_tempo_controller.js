import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { tempoLimite: Number, inicio: String }
  static targets = ["timer", "form"]

  connect() {
  console.log('Stimulus controller PROVA-TEMPO conectado!', this.inicioValue, this.tempoLimiteValue);
  this.inicio = new Date(this.inicioValue)
  this.tempoLimite = this.tempoLimiteValue * 60 // minutos para segundos
  this.updateTimer()
  this.timerInterval = setInterval(() => this.updateTimer(), 1000)
  }

  updateTimer() {
    const agora = new Date()
    const decorrido = Math.floor((agora - this.inicio) / 1000)
    const restante = this.tempoLimite - decorrido
    if (restante <= 0) {
      this.timerTarget.textContent = "Tempo esgotado! Salvando..."
      clearInterval(this.timerInterval)
      this.formTarget.submit()
    } else {
      const min = Math.floor(restante / 60)
      const seg = restante % 60
      this.timerTarget.textContent = `${min.toString().padStart(2, '0')}:${seg.toString().padStart(2, '0')}`
    }
  }

  disconnect() {
    clearInterval(this.timerInterval)
  }
}
