document.addEventListener('turbolinks:load', function () {
  const form = document.querySelector('.new_user')
  if (form) {
    form.addEventListener('input', comparisonPassowrds) }
})

function comparisonPassowrds() {

  const password = document.getElementById('user_password')
  const passwordConfirmation = document.getElementById('user_password_confirmation')

  const successIcon = document.querySelector('.octicon-check-circle-fill')
  const failIcon = document.querySelector('.octicon-alert')

  if (passwordConfirmation.value == '') {
    successIcon?.classList.add('hide')
    failIcon?.classList.add('hide')
    return;
  }

  if (password.value === passwordConfirmation.value) {
    successIcon?.classList.remove('hide')
    failIcon?.classList.add('hide')
  } else {
    successIcon?.classList.add('hide')
    failIcon?.classList.remove('hide')
  }
}
