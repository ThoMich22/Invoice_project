function addRow(){
  var a = document.getElementById("test").content;
  var copy = document.importNode(a, true)
  document.getElementById("row3").appendChild(copy);
}

document.getElementById("btnaddrow").addEventListener("click",addRow);


function deleteRowb() {
  document.getElementById("testbis").remove()
}

document.getElementById("btnstop").addEventListener("click", deleteRowb)


function deleteRow(btn) {
  var row = btn.parentNode.parentNode;
  row.parentNode.removeChild(row);
}