import { Controller } from "@hotwired/stimulus"
import 'flowbite'

export default class extends Controller {
  connect() {
    initFlowbite()
  }
} 