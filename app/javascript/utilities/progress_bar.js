document.addEventListener('turbolinks:load', function () {

  const progressBar = document.querySelector('.progress-bar')
  if (progressBar) {
    const numberOfQuestions = progressBar.dataset.numberOfQuestions
    const currentQuestionNumber = progressBar.dataset.currentQuestionNumber

    const width = (Number(currentQuestionNumber) / Number(numberOfQuestions)) * 100

    progressBar.style.width = width + "%"
  }
})
