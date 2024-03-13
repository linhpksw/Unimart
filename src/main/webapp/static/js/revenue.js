document.addEventListener('DOMContentLoaded', () => {
    const priceElements = document.querySelectorAll('.price');
    priceElements.forEach(element => {
        const amount = parseFloat(element.textContent);
        element.textContent = formatCurrencyVND(amount);
    });

    const timestampElements = document.querySelectorAll('.time');
    timestampElements.forEach(element => {
        element.textContent = customDateStringToTimestamp(element.textContent);
    });
});

function formatCurrencyVND(amount) {
    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(amount);
}

function customDateStringToTimestamp(dateString) {
    // Example input: "Wed Mar 13 08:23:51 ICT 2024"
    // Example output: 08:23:51 Thứ Tư, 13/3/2024
    const months = {
        Jan: 0, Feb: 1, Mar: 2, Apr: 3, May: 4, Jun: 5,
        Jul: 6, Aug: 7, Sep: 8, Oct: 9, Nov: 10, Dec: 11
    };
    const days = ['Chủ Nhật', 'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy'];

    // Split the dateString into components
    const parts = dateString.split(' ');
    const year = parseInt(parts[5], 10);
    const month = months[parts[1]];
    const day = parseInt(parts[2], 10);
    const timeParts = parts[3].split(':');
    const hours = parseInt(timeParts[0], 10);
    const minutes = parseInt(timeParts[1], 10);
    const seconds = parseInt(timeParts[2], 10);

    // Create a Date object using the parsed components
    const date = new Date(year, month, day, hours, minutes, seconds);

    // Format the date string
    const weekday = days[date.getDay()];
    return `${timeParts.join(':')} ${weekday}, ${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`;
}
