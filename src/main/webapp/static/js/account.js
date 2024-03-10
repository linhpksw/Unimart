document.addEventListener('DOMContentLoaded', () => {
    const timestampElements = document.querySelectorAll('.time');
    timestampElements.forEach(element => {
        element.textContent = formatTimestampToVietnameseDate(element.textContent);
    });
});

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
