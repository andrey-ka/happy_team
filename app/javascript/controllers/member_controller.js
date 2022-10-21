import { Controller } from "@hotwired/stimulus"
import axios from 'axios';

export default class extends Controller {
  static targets = [ 'state' ]
  static values = {
    url: String
  }
  initialize() {
    console.log("Stimulus at your service!")
  }
  connect() {
    console.log("connected to forms controller");
  }
  handleChange(e) {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    console.log(e);
    console.log(this.stateTarget.value);
    console.log(csrfToken);

    axios.patch(this.urlValue, {
      state: this.stateTarget.value
    }, {headers: {
        accept: 'application/json',
        'X-CSRF-Token': csrfToken
      }
    }).then((response) => response.text())
    .then(data => console.log(data))
  }
}
