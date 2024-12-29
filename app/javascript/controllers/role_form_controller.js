import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["endDate", "current"]

  connect() {
    this.toggleEndDate()
  }

  toggleEndDate() {
    const isCurrentRole = this.currentTarget.checked
    this.endDateTarget.disabled = isCurrentRole
    if (isCurrentRole) {
      this.endDateTarget.value = ''
    }
  }
} 