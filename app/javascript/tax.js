function tax () {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if(itemPrice && addTaxPrice && profit) {
  itemPrice.addEventListener('input',() => {
    const price = itemPrice.value;
    const taxPrice = Math.floor(price * 0.1);
    const salesProfit = Math.floor(price - taxPrice);

    addTaxPrice.innerHTML = taxPrice;
    profit.innerHTML = salesProfit;
  });
 }
}
window.addEventListener("DOMContentLoaded", tax);