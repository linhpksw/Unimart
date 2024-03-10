const productDetail = productDetailJson['product'];
const productItems = productDetailJson['productItems'];

const minPrice = Math.min(...productItems.map(item => item.price));
const maxPrice = Math.max(...productItems.map(item => item.price));
const totalStock = productItems.reduce((sum, item) => sum + item.stock, 0);

// console.log(productDetail);
// console.log(productItems);

document.addEventListener('DOMContentLoaded', () => {
    renderProductInfo(productDetail, productItems);
});

function renderProductInfo(productDetail, productItems) {
    const productName = document.getElementById('product-name');
    productName.textContent = productDetail.name;

    const priceRange = document.getElementById('price-range');

    if (minPrice === maxPrice) {
        priceRange.textContent = formatCurrencyVND(minPrice);
    } else {
        priceRange.textContent = formatCurrencyVND(minPrice) + ' - ' + formatCurrencyVND(maxPrice);
    }

    const totalStockElement = document.getElementById('total-stock');
    totalStockElement.textContent = `Total stock: ${totalStock}`;

    const quantity = document.getElementById('quantity');
    quantity.min = 1;
    quantity.max = totalStock;
    quantity.value = 1;

    // Automatically select the product item if only one exists
    if (productItems.length === 1) {
        const productItemIdInput = document.getElementById('product-item-id');
        productItemIdInput.value = productItems[0].id;
    }

    renderSizeOptions(productItems);
}

function renderSizeOptions(productItems) {
    // Group product items by each attribute key
    const attributesMap = productItems.reduce((acc, item) => {
        for (const [key, value] of Object.entries(item.attributes)) {
            if (!acc[key]) {
                acc[key] = new Set();
            }
            acc[key].add(value);
        }
        return acc;
    }, {});

    const container = document.getElementById('options-container');
    container.innerHTML = '';
    container.className = 'mt-3';

    // Create and append fields for each attribute
    for (const [attribute, values] of Object.entries(attributesMap)) {
        const fieldset = document.createElement('fieldset');
        const legend = document.createElement('legend');
        legend.textContent = `Choose ${attribute}`;
        legend.className = 'text-gray-600 font-medium';
        fieldset.appendChild(legend);

        const div = document.createElement('div');
        div.className = 'grid grid-cols-5 gap-4 mt-3';

        // Create and append label and radio button for each value
        values.forEach((value, index) => {
            const label = document.createElement('label');
            label.className = 'col-span-1 group relative border rounded-md py-3 px-4 flex items-center justify-center text-sm font-medium uppercase hover:bg-gray-50 focus:outline-none bg-white shadow-sm text-gray-900 cursor-pointer';

            const input = document.createElement('input');
            input.type = 'radio';
            input.name = `${attribute}`;
            input.value = value;
            input.className = 'attribute-radio sr-only';
            input.id = `${attribute}-choice-${index}`;
            input.required = true;

            input.addEventListener('change', function () {
                // Update the UI for the selected attribute
                document.querySelectorAll(`input[name='${this.name}']`).forEach(input => {
                    const parentLabel = input.closest('label');
                    const spanRing = parentLabel.querySelector('.pointer-events-none');

                    if (input.checked) {
                        parentLabel.classList.add('ring-2', 'ring-indigo-500', 'border-indigo-500'); // Active styles
                        spanRing.classList.add('border-indigo-500');
                    } else {
                        parentLabel.classList.remove('ring-2', 'ring-indigo-500', 'border-indigo-500'); // Inactive styles
                        spanRing.classList.remove('border-indigo-500');
                    }
                });

                // Find the selected product item
                const selectedProductItem = productItems.find(item => item.attributes[attribute] === value);
                if (selectedProductItem) {
                    // Update the hidden input field with the selected product item ID
                    const productItemIdInput = document.getElementById('product-item-id');
                    productItemIdInput.value = selectedProductItem.id;
                }
                updatePriceAndStock(attribute, value, minPrice, maxPrice, totalStock)
            })

            const span = document.createElement('span');
            span.textContent = value;
            span.id = `${attribute}-choice-label-${index}`;

            const spanRing = document.createElement('span');
            spanRing.className = 'pointer-events-none absolute -inset-px rounded-md';

            label.appendChild(input);
            label.appendChild(span);
            label.appendChild(spanRing);
            div.appendChild(label);
        });

        fieldset.appendChild(div);
        container.appendChild(fieldset);
    }
}

function updatePriceAndStock(attribute, value, minPrice, maxPrice, totalStock) {
    let currentPrice, currentStock, currentMinPrice, currentMaxPrice, currentTotalStock;

    const matchingItems = productItems.filter(item => item.attributes[attribute] === value);

    if (matchingItems.length > 0) {
        currentPrice = matchingItems[0].price;
        currentStock = matchingItems[0].stock;

        document.getElementById('price-range').textContent = formatCurrencyVND(currentPrice);
        document.getElementById('total-stock').textContent = `Total stock: ${currentStock}`;
        document.getElementById('quantity').min = 1;
        document.getElementById('quantity').max = currentStock;
        document.getElementById('quantity').value = 1;

    } else {
        // If no items match, revert to original min/max price and total stock
        currentMinPrice = minPrice;
        currentMaxPrice = maxPrice;
        currentTotalStock = totalStock;

        let finalPrice;

        if (currentMinPrice === currentMaxPrice) {
            finalPrice = formatCurrencyVND(currentMinPrice);
            document.getElementById('price-range').textContent = finalPrice;
        } else {
            finalPrice = `₫${currentMinPrice} - ₫${currentMaxPrice}`;
            document.getElementById('price-range').textContent = finalPrice;
        }

        document.getElementById('total-stock').textContent = `Total stock: ${currentTotalStock}`;
        document.getElementById('quantity').min = 1;
        document.getElementById('quantity').max = totalStock;
        document.getElementById('quantity').value = 1;
    }
}

function formatCurrencyVND(amount) {
    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(amount);
}
