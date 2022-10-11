document.getElementById("profile-pic-btn").addEventListener("click", function(){
  document.querySelector(".auth-popup").style.display = "flex";
})

document.querySelector(".close-btn").addEventListener("click", function(){
  document.querySelector(".auth-popup").style.display = "none";
})

document.getElementById("sign-up-btn").addEventListener("click", function(){
  document.querySelector(".sign-up").style.display = "grid";
  document.querySelector(".sign-in").style.display = "none";
})

document.getElementById("sign-in-btn").addEventListener("click", function(){
  document.querySelector(".sign-in").style.display = "grid";
  document.querySelector(".sign-up").style.display = "none";
})