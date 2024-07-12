const chart = document.querySelector('.chart');
const percentage = chart.dataset.percentage;

chart.style.backgroundImage = `conic-gradient(
 #4CAF50 ${percentage}%,
 #f5f5f5 ${percentage}%
)`;

chart.querySelector('.percentage').textContent = percentage + '%';