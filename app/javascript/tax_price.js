function price_tax() {
  const price = document.getElementById("item-price");
  const priceTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener('input', () => {
    const priceValue = price.value;
    const tax = priceValue * 0.1;
    priceTax.innerHTML = Math.floor(tax);
    profit.innerHTML = Math.floor(priceValue - tax);
  });
};
window.addEventListener('load', price_tax);