import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    convert(event) {
        event.preventDefault()
        console.log("yeah bob")
        //if (document.getElementById("topbar-respondsive").style.display == "none") {
            //document.getElementById("topbar-respondsive").style.display = ""
        //} else {
            //document.getElementById("topbar-respondsive").style.display == "none"
        //}
    }

}
