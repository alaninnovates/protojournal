import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editable"
export default class extends Controller {
    static targets = ["display", "form", "textarea"]

    edit() {
        this.displayTargets.forEach(t => t.classList.add("hidden"));
        this.formTarget.classList.remove("hidden");

        this.textareaTarget.focus();
    }

    save() {
        this.formTarget.requestSubmit();
    }
}
