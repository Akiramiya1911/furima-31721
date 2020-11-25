window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const salesProfit = document.getElementById("profit");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    taxPrice.innerHTML = Math.floor(inputValue * 0.1);
    salesProfit.innerHTML = inputValue - Math.floor(inputValue * 0.1);
  });
});