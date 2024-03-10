console.log(productDetailJson)

const product = productDetailJson['product'];
const productItems = productDetailJson['productItems'];

document.addEventListener('DOMContentLoaded', () => {
    setupImagePreviewsAndUploads(imageSrc);

    const priceInputOnly = document.getElementById('price-only');
    const priceValueOnly = parseFloat(priceInputOnly.value);
    if (priceValueOnly % 1 === 0) { // Check if the value is a whole number
        priceInputOnly.value = priceValueOnly.toFixed(0); // Format to remove trailing .0
    }

    const priceInputs = document.querySelectorAll('input[id^="product-price-"]');
    priceInputs.forEach(function (input) {
        const priceValue = parseFloat(input.value);
        if (priceValue % 1 === 0) { // Check if the value is a whole number
            input.value = priceValue.toFixed(0); // Format to remove trailing .0
        } // If it's not a whole number, the value remains unchanged
    });
});

function setupImagePreviewsAndUploads(imageSrc) {
    product.images.forEach((imageName, index) => {
        // Increment index to match your input IDs, assuming they start at 1
        const inputIndex = index + 1;
        const fileInput = document.getElementById(`file${inputIndex}`);
        const previewContainerId = `preview-container-${inputIndex}`;
        const imagePreviewContainer = document.querySelector(`#${previewContainerId}`);

        // Initialize the preview container with existing image if available
        if (imageName) {
            imagePreviewContainer.innerHTML = getImagePreviewHtml(imageSrc + '/' + imageName, inputIndex);
        } else {
            // Setup for a new upload if no existing image is present
            imagePreviewContainer.innerHTML = getUploadPromptHtml(inputIndex);
        }

        // Listen for changes to file input to handle new uploads
        setupFileInput(fileInput, inputIndex);
    });
}

function setupFileInput(uploadInput, index) {
    uploadInput.addEventListener('change', function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = (e) => {
                const previewContainerId = `preview-container-${index}`;
                const imagePreviewContainer = document.querySelector(`#${previewContainerId}`);
                imagePreviewContainer.innerHTML = getImagePreviewHtml(e.target.result, index);
            };
            reader.readAsDataURL(file);
        }
    });
}

function getImagePreviewHtml(imageSrc, index) {
    return `
        <div class="flex flex-col items-center justify-center h-20">
            <img src="${imageSrc}" class="object-cover w-20 h-20 rounded-lg" alt="Image preview ${index}">
            <button class="mt-2 delete-btn" type="button" onclick="resetImageInput(${index})">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 stroke-red-500" fill="none" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>`;
}

function getUploadPromptHtml(index) {
    return `
        <label for="file${index}" class="cursor-pointer">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8 text-gray-700 mx-auto mb-4">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3 16.5v2.25A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75V16.5m-13.5-9L12 3m0 0l4.5 4.5M12 3v13.5"></path>
            </svg>
            <h5 class="mb-2 font-bold tracking-tight text-gray-700">Upload Image ${index}</h5>
        </label>`;
}

function resetImageInput(index) {
    const fileInput = document.getElementById(`file${index}`);
    fileInput.value = ''; // Clear the input
    const previewContainerId = `preview-container-${index}`;
    const imagePreviewContainer = document.querySelector(`#${previewContainerId}`);
    imagePreviewContainer.innerHTML = getUploadPromptHtml(index); // Reset to upload prompt
}
