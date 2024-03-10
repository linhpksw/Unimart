console.log(cartJson)

const items = cartJson['items'];

document.addEventListener('DOMContentLoaded', () => {
    const cartItemList = document.getElementById('cart-item-container');
    const subtotalElement = document.getElementById('subtotal');
    const taxElement = document.getElementById('tax');
    const shippingElement = document.getElementById('shipping');
    const totalElement = document.getElementById('total');
    const shipping = 5000;
    const taxRate = 0.1;

    cartItemList.innerHTML = ''; // Clear the container

    items.forEach((item, index) => {
        const li = document.createElement('li');
        li.className = "flex py-6";

        const divImageWrapper = document.createElement('div');
        divImageWrapper.className = "flex-shrink-0";

        const img = document.createElement('img');
        img.src = `${imageSrc}/${item.productImages[0]}`;
        img.alt = "";
        img.className = "h-24 w-24 rounded-md object-cover object-center";

        divImageWrapper.appendChild(img);

        const divContent = document.createElement('div');
        divContent.className = "ml-4 flex flex-1 justify-between";

        const productAttributes = Object.entries(item.attributes).map(([key, value]) => `${key}: ${value}`).join(', ');

        // Dynamic HTML content for product details
        const divProductNamePrice = document.createElement('div');
        divProductNamePrice.innerHTML = `
            <div>
                <div class="flex justify-between">
                    <h3 class="text-sm">
                        <a href="${contextPath}/product/${item.productId}" class="font-medium text-gray-700 hover:text-gray-800">${item.productName}</a>
                    </h3>
                </div>
                <div class="mt-1 flex text-sm">
                    <p class="text-gray-500">${productAttributes}</p>
                </div>
                <p class="mt-1 text-sm font-medium text-gray-900">${formatCurrencyVND(item.price)}</p>
            </div>
        `;

        // Quantity input
        const divQuantity = document.createElement('div');
        divQuantity.className = "mt-0 flex items-start justify-between gap-36";
        divQuantity.innerHTML = `
            <input id="quantity-${index}" 
            type="number" min="1" max="${item.stock}" value="${item.quantity}"
                   class="w-16 rounded-md border border-gray-300 py-1.5 text-left text-lg leading-6 text-gray-600 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500">
                   
            <button type="button" class=" inline-flex p-2 text-red-500 hover:text-red-700">
                <span class="sr-only">Remove</span>
                <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M6.28 5.22a.75.75 0 00-1.06 1.06L8.94 10l-3.72 3.72a.75.75 0 101.06 1.06L10 11.06l3.72 3.72a.75.75 0 101.06-1.06L11.06 10l3.72-3.72a.75.75 0 00-1.06-1.06L10 8.94 6.28 5.22z" clip-rule="evenodd"></path>
                </svg>
            </button>
        `;

        const deleteButton = divQuantity.querySelector('button');
        deleteButton.addEventListener('click', function () {
            const confirmDelete = confirm("Are you sure you want to remove this item from your cart?");
            if (confirmDelete) {
                window.location.href = `${contextPath}/cart?action=deleteCartItem&productItemId=${item.productItemId}`;
            }
        });

        // Append child elements
        divContent.appendChild(divProductNamePrice);
        divContent.appendChild(divQuantity);

        li.appendChild(divImageWrapper);
        li.appendChild(divContent);

        cartItemList.appendChild(li);

        // Update subtotal, tax, and total
        const quantityInput = divQuantity.querySelector(`#quantity-${index}`);

        quantityInput.addEventListener('change', (e) => {
            // Update item quantity based on input
            item.quantity = parseInt(e.target.value, 10);
            // Recalculate and update the order summary
            updateOrderSummary();
        });
    });

    function updateOrderSummary() {
        // Calculate the new subtotal based on updated quantities
        const subtotal = items.reduce((acc, item) => acc + (item.quantity * item.price), 0);
        // Calculate tax
        const tax = subtotal * taxRate;
        // Calculate total
        const total = subtotal + tax + shipping;

        // Update the DOM elements
        subtotalElement.textContent = formatCurrencyVND(subtotal);
        taxElement.textContent = formatCurrencyVND(tax);
        shippingElement.textContent = formatCurrencyVND(shipping);
        totalElement.textContent = formatCurrencyVND(total);

        // Update the hidden input with the latest cart data
        const updatedCartData = {
            userId: cartJson['userId'],
            subTotal: subtotal,
            shipping: shipping,
            tax: tax,
            total: total,
            items: items.map(item => ({
                productId: item.productId,
                productItemId: item.productItemId,
                quantity: item.quantity,
                price: item.price,
                storeId: item.storeId,
                productName: item.productName,
                productImage: item.productImages[0],
                attributes: item.attributes,
            }))
        };

        // Format updatedCartData as a JSON string and update the hidden input's value
        document.getElementById('cart-data').value = JSON.stringify(updatedCartData);
    }

    // Initial update for order summary based on initial quantities
    updateOrderSummary();
});

function formatCurrencyVND(amount) {
    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(amount);
}
