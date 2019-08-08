let point;
let price;
function chose_item(item) {
    let count;
    point = document.getElementById('shop_list_item_point_'+item).innerText;
    price = document.getElementById('shop_list_item_price_'+item).innerText;
    for(count = 1; document.getElementById('shop_list_item_'+count) != null; count++) {
        document.getElementById('shop_list_item_'+count).style.border = '3px solid #656565';
        document.getElementById('shop_list_item_'+count).style.color = '#656565';
    }
    document.getElementById('shop_list_item_'+item).style.border = '3px solid #ff8934';
    document.getElementById('shop_list_item_'+item).style.color = '#ff8934';
    document.getElementById('shop_button_price').innerText = '결제 포인트 +'+point+'한라봉';
}
function pay() {
    document.getElementById('shop_pay_point').value = point;
    document.getElementById('shop_pay_price').value = price;
    document.getElementById('shop_form').submit();
}
window.onload = function() {
    chose_item(1);
};