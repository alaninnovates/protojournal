import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="photo-association"
export default class extends Controller {
    static targets = ["objectiveTitle", "objectiveList"]
    static values = {photoId: Number, selectedProjectId: Number}

    connect() {
        const triggerButton = document.querySelector('[data-photo-id]')
        if (triggerButton?.dataset.photoId) {
            this.photoIdValue = triggerButton.dataset.photoId
            console.log('PhotoAssociationController connected for photo ID:', this.photoIdValue)
        }
    }

    selectProject(event) {
        const projectId = event.currentTarget.dataset.projectId
        this.selectedProjectIdValue = projectId

        fetch(`/projects/${projectId}/objectives/latest_journal_objectives`)
            .then(response => response.json())
            .then(objectives => {
                // console.log('Fetched objectives:', objectives)
                this.renderObjectives(objectives)
                this.switchToObjectiveView()
            })
    }

    renderObjectives(objectives) {
        // console.log('rendering objectives, ', this.photoIdValue)
        const container = this.objectiveListTarget
        container.innerHTML = ""

        if (objectives.length === 0) {
            container.innerHTML = '<p class="text-gray-500">No objectives found for the latest week.</p>'
            return
        }

        objectives.forEach(objective => {
            const objectiveEl = document.createElement("div")
            objectiveEl.className = "px-3 py-2 hover:bg-gray-50 flex items-center cursor-pointer w-full"
            objectiveEl.dataset.action = "click->photo-association#selectObjective"
            objectiveEl.dataset.objectiveId = objective.id
            objectiveEl.dataset.photoId = this.photoIdValue
            objectiveEl.innerHTML = `<span class="truncate">${objective.description}</span>`
            container.appendChild(objectiveEl)
        })
    }

    selectObjective(event) {
        const objectiveId = event.currentTarget.dataset.objectiveId
        const photoId = event.currentTarget.dataset.photoId
        // console.log('Associating photo', photoId, 'with objective', objectiveId)

        fetch(`/photos/${photoId}/associate`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": this.getCSRFToken()
            },
            body: JSON.stringify({
                objective_id: objectiveId,
            })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    this.closeModal()
                    window.location.reload()
                }
            })
            .catch(error => console.error("Error:", error))
    }

    switchToObjectiveView() {
        document.getElementById("select-project").classList.add("hidden")
        document.getElementById("select-objective").classList.remove("hidden")
    }

    backToProjects() {
        document.getElementById("select-objective").classList.add("hidden")
        document.getElementById("select-project").classList.remove("hidden")
    }

    closeModal() {
        document.getElementById("add-to-project-modal").classList.add("hidden")
    }

    getCSRFToken() {
        return document.querySelector('meta[name="csrf-token"]').getAttribute("content")
    }
}
