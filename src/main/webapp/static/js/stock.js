document.addEventListener('DOMContentLoaded', () => {
    formatCurrencyVNDForElements();
});

function formatCurrencyVNDForElements() {
    const priceElements = document.querySelectorAll('.price');

    priceElements.forEach(element => {
        const amount = parseFloat(element.textContent);
        element.textContent = formatCurrencyVND(amount);
    });
}

function formatCurrencyVND(amount) {
    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(amount);
}
