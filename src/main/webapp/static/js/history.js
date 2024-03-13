console.log('why', ordersJson);

document.addEventListener('DOMContentLoaded', () => {
    const ordersContainer = document.getElementById('orders-container');
    renderOrders(ordersJson, ordersContainer);
});

function renderOrders(orders, container) {
    container.innerHTML = '';

    orders.forEach((order, index) => {
        const items = order.items;

        const orderElement = document.createElement('div');
        orderElement.className = 'border-gray-200 border shadow-sm rounded-lg';

        const orderDate = new Date(order.orderDate);
        const formattedDate = formatTimestampToVietnameseDate(orderDate);

        orderElement.innerHTML = `
            <div class="border-b border-gray-200 p-4 grid grid-cols-12 gap-x-7">
                <dl class="col-span-11 grid grid-cols-12 flex-1 gap-x-4 ">
                    <div class="col-span-1">
                        <dt class="font-medium text-gray-900 text-center">No</dt>
                        <dd class="mt-1 text-gray-500 text-center">${index * 1.0 + 1}</dd>
                    </div>
                    <div class="col-span-2">
                        <dt class="font-medium text-gray-900">Order number</dt>
                        <dd class="mt-1 text-gray-500">#${order.orderId}</dd>
                    </div>
                    <div class="col-span-4">
                        <dt class="font-medium text-gray-900">Date placed</dt>
                        <dd class="mt-1 text-gray-500">${formattedDate}</dd>
                    </div>
                    <div class="col-span-2">
                        <dt class="font-medium text-gray-900 text-right">Total amount</dt>
                        <dd class="mt-1 text-gray-500 text-right">${formatCurrencyVND(order.total)}</dd>
                    </div>
                    <div class="col-span-3">
                        <dt class="font-medium text-gray-900 text-center">Store</dt>
                        <dd class="mt-1 text-gray-500 text-center">${items[0].storeId}</dd>
                    </div>
                </dl>
                
                <div class="col-span-1 flex items-center justify-end">
                    <a href="${contextPath}/order/${order.orderId}"
                       class="inline-flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-2.5 py-2 font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 w-auto">
                        <span>View</span>
                    </a>
                </div>
            </div>
        `;

        container.appendChild(orderElement);
    })
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

function formatCurrencyVND(amount) {
    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(amount);
}
