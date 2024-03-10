document.addEventListener('DOMContentLoaded', () => {
    const priceElements = document.querySelectorAll('.price');
    priceElements.forEach(element => {
        const amount = parseFloat(element.textContent);
        element.textContent = formatCurrencyVND(amount);
    });

    const timestampElements = document.querySelectorAll('.time');
    timestampElements.forEach(element => {
        const timestamp = customDateStringToTimestamp(element.textContent);
        element.textContent = formatTimestampToVietnameseDate(timestamp);
    });
});

function formatCurrencyVND(amount) {
    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(amount);
}

function customDateStringToTimestamp(dateString) {
    // Example input: "Fri Mar 08 13:50:42 ICT 2024"
    const months = {
        Jan: 0, Feb: 1, Mar: 2, Apr: 3, May: 4, Jun: 5,
        Jul: 6, Aug: 7, Sep: 8, Oct: 9, Nov: 10, Dec: 11
    };
    const parts = dateString.split(' ');
    const year = parseInt(parts[5], 10);
    const month = months[parts[1]];
    const day = parseInt(parts[2], 10);
    const timeParts = parts[3].split(':');
    const hours = parseInt(timeParts[0], 10);
    const minutes = parseInt(timeParts[1], 10);
    const seconds = parseInt(timeParts[2], 10);

    // Assuming ICT timezone is +7 hours from UTC
    const date = new Date(Date.UTC(year, month, day, hours, minutes, seconds));
    // Adjust for the timezone offset
    date.setHours(date.getHours() + 7);

    return date.getTime();
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
