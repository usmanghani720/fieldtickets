function toggleNavMenu() {
    var x = document.getElementById("sidebar");
    if (x.className === "responsive") {
        x.className = "";
    } else {
      x.className = "responsive";
    }
}