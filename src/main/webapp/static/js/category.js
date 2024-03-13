document.addEventListener('DOMContentLoaded', function () {
    generateCategories(selectedCategories);
    generateSorts(selectedSort);
    setupEventListeners();
});


function generateCategories(selectedCategories) {
    const categories = [
        "All categories", "Men Clothes", "Mobile & Gadgets", "Home & Living", "Watches", "Grocery", "Home care", "Pets"];
    const container = document.getElementById('category-container');
    categories.forEach((category, index) => {
        const div = document.createElement('div');
        div.className = 'flex items-center';
        const input = document.createElement('input');
        input.type = 'checkbox';
        input.id = 'category-' + index;
        input.name = 'category';
        input.value = category;
        input.className = 'h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500';
        const label = document.createElement('label');
        label.htmlFor = 'category-' + index;
        label.className = 'ml-3 text-sm text-gray-600';
        label.textContent = category;

        if (selectedCategories.includes(category)) {
            input.checked = true;
        }

        div.appendChild(input);
        div.appendChild(label);
        container.appendChild(div);
    });
}

function generateSorts(selectedSort) {
    const sortOptions = [
        {id: 'most-popular', name: 'sort', value: 'most-popular', label: 'Most Popular'},
        {id: 'best-rating', name: 'sort', value: 'best-rating', label: 'Best Rating'},
        {id: 'newest', name: 'sort', value: 'newest', label: 'Newest'},
        {id: 'price-low-high', name: 'sort', value: 'price-low-high', label: 'Price: Low to High'},
        {id: 'price-high-low', name: 'sort', value: 'price-high-low', label: 'Price: High to Low'},
    ];

    // Get the sort container
    const sortContainer = document.getElementById('sort-container');

    sortOptions.forEach(option => {
        const div = document.createElement('div');
        div.className = 'flex items-center';

        const input = document.createElement('input');
        input.setAttribute('id', option.id);
        input.setAttribute('name', option.name);
        input.setAttribute('value', option.value);
        input.setAttribute('type', 'radio');
        input.className = 'h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500';

        const label = document.createElement('label');
        label.setAttribute('for', option.id);
        label.className = 'ml-3 text-sm text-gray-600';
        label.textContent = option.label;

        if (option.value === selectedSort) {
            input.checked = true;
        }

        div.appendChild(input);
        div.appendChild(label);

        sortContainer.appendChild(div);
    });

}

function setupEventListeners() {
    const sortInputs = document.querySelectorAll('input[name="sort"]');
    sortInputs.forEach(input => {
        input.addEventListener('change', updateURL);
    });

    const categoryInputs = document.querySelectorAll('input[name="category"]');
    categoryInputs.forEach(input => {
        input.addEventListener('change', updateURL);
    });


}

function updateURL() {
    const sortSelection = document.querySelector('input[name="sort"]:checked');
    const selectedSort = sortSelection ? sortSelection.value : '';

    const selectedCategories = Array.from(document.querySelectorAll('input[name="category"]:checked'))
        .map(input => encodeURIComponent(input.value)).join(',');

    const sortParam = selectedSort === '' ? '' : `${selectedSort}`;
    const categoryParam = selectedCategories === '' ? '' : `${selectedCategories}`;

    window.location.href = `${contextPath}/categories?sort=${selectedSort}&category=${categoryParam}`;
}
