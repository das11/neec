const button = document.querySelectorAll('.btn')
const adForm = document.getElementById('ad-form')

button.forEach((btn) =>{
    btn.addEventListener('click', ()=>{
        adForm.style.border = "3px solid blue"
        setTimeout(()=>{
        adForm.style.border = "none"
        },2000)
    })
})
