import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-dump"
export default class extends Controller {
    filesChanged(event) {
        console.log('file selected, submitting form');
        this.element.requestSubmit();
    }
}
