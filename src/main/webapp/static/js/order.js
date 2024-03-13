console.log(orderJson)

document.addEventListener('DOMContentLoaded', () => {
    renderOrderItems(orderJson.items);
    renderOrderSummary(orderJson);
});

function renderOrderItems(items) {
    const orderIdHeader = document.querySelector('#order-id-header');
    orderIdHeader.innerText = `Order #${orderJson.orderId}`;

    const itemsContainer = document.querySelector('#items-container');
    itemsContainer.innerHTML = '';

    items.forEach(item => {
        const itemHtml = `
           <div class="grid grid-cols-12 gap-x-8 p-6">
                <div class="flex col-span-7">
                    <div class="w-24 h-24 flex-shrink-0 overflow-hidden rounded-lg ">
                        <img src="${imageSrc}/${item.productImage}"
                             alt=""
                             class="h-full w-full object-cover object-center">
                    </div>
                    
                    <div class="mt-0 ml-6">
                        <h3 class="text-base font-medium text-gray-900">
                            <a href="${contextPath}/product/${item.productId}">${item.productName}</a>
                        </h3>
                        <p class="mt-2 font-medium text-gray-900">${formatCurrencyVND(item.price)}</p>
                        <p class="mt-3 text-gray-500">${Object.keys(item.attributes).map(key => `${key} | ${item.attributes[key]}`).join(', ')}</p>
                    </div>
                </div>
                
                <div class="col-span-5 mt-0">
                    <dl class="grid grid-cols-2 gap-x-6">
                        <div>
                            <dt class="font-medium text-gray-900">Quantity</dt>
                            <dd class="mt-3 text-gray-500">
                                <span class="block">${item.quantity}</span>
                            </dd>
                        </div>
                        <div>
                            <dt class="font-medium text-gray-900">Store</dt>
                            <dd class="mt-3 space-y-3 text-gray-500">${item.storeId}</dd>
                        </div>
                    </dl>
                </div>
            </div>`;

        itemsContainer.innerHTML += itemHtml;
    });
}

function formatCurrencyVND(amount) {
    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(amount);
}

function renderOrderSummary(order) {
    // Update the order summary fields
    document.querySelector('#sub-total').textContent = formatCurrencyVND(order.subTotal);
    document.querySelector('#shipping').textContent = formatCurrencyVND(order.shipping);
    document.querySelector('#tax').textContent = formatCurrencyVND(order.tax);
    document.querySelector('#total').textContent = formatCurrencyVND(order.total);
    document.querySelector('#order-date').textContent = formatTimestampToVietnameseDate(order.orderDate);
}

function formatTimestampToVietnameseDate(timestamp) {
    const date = new Date(timestamp);
    const options = {
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        weekday: 'long',
        day: 'numeric',
        month: 'numeric',
        year: 'numeric',
        hour12: false
    };

    return new Intl.DateTimeFormat('vi-VN', options).format(date);
}
