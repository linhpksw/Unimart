document.addEventListener('DOMContentLoaded', () => {
    // Handling image upload and preview
    function setupFileInput(uploadInput) {
        const number = uploadInput.id.match(/\d+/)[0];
        const previewContainerId = `preview-container-${number}`;
        const imagePreviewContainer = document.querySelector(`#${previewContainerId}`);

        function handleFileSelection(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    imagePreviewContainer.innerHTML = `
                        <div class="flex flex-col items-center justify-center h-20">
                            <img src="${e.target.result}" class="object-cover w-20 h-20 rounded-lg" alt="Image preview ${number}">
                            <button class="mt-2 delete-btn" type="button">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 stroke-red-500" fill="none" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                                </svg>
                            </button>
                        </div>`;

                    const deleteBtn = imagePreviewContainer.querySelector('.delete-btn');
                    deleteBtn.addEventListener('click', () => {
                        imagePreviewContainer.innerHTML = ''; // Clear the preview container
                    });
                };
                reader.readAsDataURL(file);
            }
        }

        uploadInput.addEventListener('change', handleFileSelection);
    }

    document.querySelectorAll('input[type="file"]').forEach(setupFileInput);

    // Handling product information
    const addClassBtn = document.getElementById("add-class");
    const deleteClassBtn = document.getElementById("delete-class");
    const isClassifiedInput = document.getElementById("isClassified");
    const productOnlyContainer = document.getElementById("product-only-container");
    const productManyContainer = document.getElementById("product-many-container");
    const classHeaderContainer = document.getElementById("class-header-container");
    const totalClassContainer = document.getElementById("total-class-container");
    const classHeaderInput = document.getElementById("class-header");
    const totalClassInput = document.getElementById("total-class");
    const productClassListContainer = document.getElementById("product-class-list");
    const thead = productClassListContainer.querySelector("table > thead > tr");
    const tbody = productClassListContainer.querySelector("table > tbody");

    // Event listeners for button clicks to toggle visibility of sections
    addClassBtn.addEventListener("click", toggleClassificationVisibility.bind(null, true));
    deleteClassBtn.addEventListener("click", toggleClassificationVisibility.bind(null, false));

    // Listen for changes in total classification to update inputs and table rows
    totalClassInput.addEventListener('change', handleTotalClassificationChange);

    // Update the table header when classification group input changes
    classHeaderInput.addEventListener('change', updateTableHeader);

    function toggleClassificationVisibility(show) {
        // Toggle visibility of relevant sections based on button clicks
        addClassBtn.classList.toggle('hidden', show);
        deleteClassBtn.classList.toggle('hidden', !show);
        productOnlyContainer.classList.toggle('hidden', show);
        productManyContainer.classList.toggle('hidden', !show);
        classHeaderContainer.classList.toggle('hidden', !show);
        totalClassContainer.classList.toggle('hidden', !show);
        isClassifiedInput.value = show ? "true" : "false";
    }

    function handleTotalClassificationChange() {
        // Generate dynamic inputs for product classification
        updateProductClassInputs();
        // Generate or clear table rows based on total classification
        updateProductClassificationList();
        // Delay attaching event listeners to ensure inputs are rendered
        setTimeout(updateTableRow, 0);
    }

    function updateTableHeader() {
        // Update table header based on classification group input
        const classificationGroup = classHeaderInput.value.trim();
        thead.cells[0].innerText = classificationGroup ? classificationGroup : 'Classification';
    }

    function updateProductClassInputs() {
        // Clear existing inputs and generate new ones based on total classification
        const totalClass = parseInt(totalClassInput.value, 10);
        const container = document.getElementById("product-class-inputs-container");
        const tableContainer = document.getElementById("table-container");

        container.classList.toggle('hidden', isNaN(totalClass) || totalClass <= 0);
        tableContainer.classList.toggle('hidden', isNaN(totalClass) || totalClass <= 0);
        container.innerHTML = "";

        if (!isNaN(totalClass) && totalClass > 0) {
            for (let i = 1; i <= totalClass; i++) {
                const div = document.createElement("div");
                div.className = "col-span-3";
                div.innerHTML = `
                    <label for="product-class-${i}" class="block font-medium leading-6 text-gray-900">Product classification ${i}</label>
                    <div class="mt-2">
                        <input type="text" name="product-class-${i}" id="product-class-${i}"
                               class="product-class block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600">
                    </div>`;
                container.appendChild(div);
            }
        }
    }

    function updateTableRow() {
        // Update table rows based on values from dynamic inputs for product classification
        const inputs = document.querySelectorAll(".product-class");
        inputs.forEach((input, index) => {
            input.addEventListener('change', function () {
                const value = this.value.trim();
                if (tbody.rows.length > index) {
                    const cell = tbody.rows[index].cells[0];
                    cell.innerHTML = `<div class="px-3 py-2 text-center text-gray-500">${value}</div>`;
                }
            });
        });
    }

    function updateProductClassificationList() {
        const totalClass = parseInt(totalClassInput.value, 10);
        tbody.innerHTML = ""; // Clear existing rows

        if (!isNaN(totalClass) && totalClass > 0) {
            for (let i = 1; i <= totalClass; i++) {
                const row = tbody.insertRow();

                // Cell for product type/classification (first cell)
                const typeCell = row.insertCell();
                typeCell.className = "px-3 py-2 text-center text-gray-500";
                // This will be dynamically updated based on input from 'product-class-X'
                typeCell.innerHTML = "Type " + i;

                // Cell for product price (second cell)
                const priceCell = row.insertCell();
                priceCell.className = "px-3 py-2 text-gray-500";
                priceCell.innerHTML = `
                <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600">
                    <span class="flex select-none items-center pl-3 text-gray-500">₫</span>
                    <input type="text" name="product-price-${i}" id="product-price-${i}"
                           class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0"
                           placeholder="">
                </div>`;

                // Cell for product quantity (third cell)
                const quantityCell = row.insertCell();
                quantityCell.className = "px-3 py-2 text-gray-500";
                quantityCell.innerHTML = `
                <input type="number" name="product-quantity-${i}" id="product-quantity-${i}"
                       class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600">`;
            }
        }
    }
});
