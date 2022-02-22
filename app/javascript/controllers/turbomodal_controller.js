import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbomodal"
export default class extends Controller {
  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal()
    }
  }
  showModal() {
    this.policeOverlay()
  }

  hideModal() {
    this.policeOverlay()
    this.element.remove()
  }
  policeOverlay() {
    if (document.getElementById("z-modal-overlay").classList.contains("noShow")) {
      //remove noShow
      document.getElementById("z-modal-overlay").classList.remove("noShow")
    } else {
      //add noShow
      document.getElementById("z-modal-overlay").classList.add("noShow")
    }
  }
  modalClose() {
    this.policeOverlay()
  }
}

