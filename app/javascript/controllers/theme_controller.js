// Dark Mode Toggle Controller
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const toggleBtn = document.getElementById('themeToggle')
    if (toggleBtn) {
      toggleBtn.addEventListener('click', () => this.toggleTheme())
      this.updateToggleIcon()
    }
  }

  toggleTheme() {
    const currentTheme = document.documentElement.getAttribute('data-theme')
    const newTheme = currentTheme === 'light' ? 'dark' : 'light'

    document.documentElement.setAttribute('data-theme', newTheme)
    localStorage.setItem('theme', newTheme)
    this.updateToggleIcon()
  }

  updateToggleIcon() {
    const currentTheme = document.documentElement.getAttribute('data-theme')
    const toggleBtn = document.getElementById('themeToggle')

    if (toggleBtn) {
      const icon = toggleBtn.querySelector('i')
      if (icon) {
        icon.classList.remove('fa-moon', 'fa-sun')
        if (currentTheme === 'dark') {
          icon.classList.add('fa-sun')
        } else {
          icon.classList.add('fa-moon')
        }
      }
    }
  }
}

}
