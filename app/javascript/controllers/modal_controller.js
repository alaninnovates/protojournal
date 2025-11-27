import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
    show(event) {
        console.log('Showing modal dialog');
        const modalElement = document.getElementById(event.params.dialog);

        modalElement.classList.remove("hidden")
        document.body.classList.add("overflow-hidden")

        requestAnimationFrame(() => {
            const content = modalElement.querySelector('#modal-content')
            if (content) {
                content.classList.remove('opacity-0', 'scale-95');
                content.classList.add('opacity-100', 'scale-100');
            }
        })

        setTimeout(() => {
            const firstInput = modalElement.querySelector("input, textarea")
            if (firstInput) firstInput.focus()
        }, 100)
    }

    close(event) {
        console.log('Closing modal dialog');
        const content = this.element.querySelector('#modal-content')

        if (content) {
            content.classList.remove('opacity-100', 'scale-100');
            content.classList.add('opacity-0', 'scale-95');
        }

        setTimeout(() => {
            this.element.classList.add("hidden")
            document.body.classList.remove("overflow-hidden")
        }, 100)
    }
}
