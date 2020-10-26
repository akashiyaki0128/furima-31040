const calculate = () => {
  // 表示変更箇所のIDを取得し、functionを作成、keyupで発火する設定、itemPriceに入力値のvalueを代入
  const sellPrice = document.getElementById("item-price");
  sellPrice.addEventListener("keyup",() => {
    const itemPrice = sellPrice.value;
    // 販売手数料の計算と表示の記述
    const fee = itemPrice / 10;
    const feePrice = document.getElementById("add-tax-price")
    feePrice.innerHTML = `${fee}`

    // 販売利益の計算と表示の記述
    const profit = itemPrice - fee;
    const profitPrice = document.getElementById("profit")
    profitPrice.innerHTML = `${profit}`
  });
};

window.addEventListener("load", calculate);