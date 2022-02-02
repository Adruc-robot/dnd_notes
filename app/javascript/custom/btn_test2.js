function doot() {

    console.log(window.getComputedStyle(document.getElementById("topbar-responsive")).display);
    if (getComputedStyle(document.getElementById("topbar-responsive")).display == "none") {
        //change display to block
        document.getElementById("topbar-responsive").style.display = "block";
    } else {
        //change display to none
        document.getElementById("topbar-responsive").style.display = "none";
    }

}
