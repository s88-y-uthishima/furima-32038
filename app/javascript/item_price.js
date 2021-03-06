window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput != null) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");
      const charge = Math.floor(inputValue * 0.1);
      addTaxDom.innerHTML = charge;
      profitDom.innerHTML =  Math.floor(inputValue - charge);
    });
  };
});