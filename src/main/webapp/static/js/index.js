document.addEventListener('DOMContentLoaded', () => {
    const categoryContainer = document.querySelector('#category-container');
    const categoryList = [
        'Home & Living',
        'Grocery',
        'Mobile & Gadgets',
        'Watches',
        'Home care'
    ];
    const categoryImage = [
        'home-living.jpg',
        'grocery.jpg',
        'mobile-gadgets.jpg',
        'watches.jpg',
        'home-care.jpg'
    ];
    const categoryListHtml = categoryList.map((c, i) => {
        return `
        <a href="#"
           class="relative flex flex-col overflow-hidden rounded-lg p-6 hover:opacity-75 w-36 h-40">
            <span aria-hidden="true" class="absolute inset-0">
                <img src="${contextPath}/static/images/categories/${categoryImage[i]}" alt="${c}"
            class="h-full w-full object-cover object-center">
            </span>
            <span aria-hidden="true"
                  class="absolute inset-x-0 bottom-0 h-2/3 bg-gradient-to-t from-gray-800 opacity-50"></span>
            <span class="relative mt-auto text-center font-bold text-white">${c}</span>
        </a>`
    });
    categoryContainer.innerHTML = categoryListHtml.join('');
});
