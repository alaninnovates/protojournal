import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="photo-description"
export default class extends Controller {
    static values = {photoId: Number}

    editDescription(event) {
        const descriptionEl = this.element.querySelector('#description')
        const currentDescription = descriptionEl.textContent === "No description" ? "" : descriptionEl.textContent

        const textarea = document.createElement('textarea')
        textarea.value = currentDescription
        textarea.className = "w-[200px] p-1 border border-gray-300 rounded-md"
        textarea.rows = 3

        this.element.replaceChild(textarea, descriptionEl)
        textarea.focus()

        textarea.addEventListener('blur', () => {
            const newDescription = textarea.value.trim()
            this.saveDescription(newDescription)
        })
    }

    saveDescription(newDescription) {
        fetch(`/photos/${this.photoIdValue}`, {
            method: 'PATCH',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': this.getCSRFToken()
            },
            body: JSON.stringify({description: newDescription})
        })
            .then(data => {
                console.log('data', data)
                if (data.ok) {
                    this.updateDescriptionElement(newDescription)
                }
            })
    }

    updateDescriptionElement(newDescription) {
        const descriptionEl = document.createElement('p')
        descriptionEl.id = 'description'
        descriptionEl.className = "mt-1 text-xs text-gray-600 break-words w-[200px] whitespace-normal"
        descriptionEl.textContent = newDescription || "No description"

        const textarea = this.element.querySelector('textarea')
        this.element.replaceChild(descriptionEl, textarea)
    }

    removePhoto(event) {
        fetch(`/photos/${this.photoIdValue}`, {
            method: 'DELETE',
            headers: {
                'X-CSRF-Token': this.getCSRFToken()
            },
        }).then(data => {
            if (data.ok) {
                this.element.remove()
            }
        })
    }

    getCSRFToken() {
        return document.querySelector('meta[name="csrf-token"]').getAttribute("content")
    }
}
