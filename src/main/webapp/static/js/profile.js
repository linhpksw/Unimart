window.addEventListener('DOMContentLoaded', (event) => {
    const shopActivated = '<%= sessionScope.shopActivated %>' === 'true';

    if (shopActivated) {
        // This will set the switch to the "activated" state if it's not already.
        toggleShopActivate();
    }
});

function toggleShopActivate() {
    console.log('toggling shop activation');

    const button = document.getElementById('shopActivateBtn');
    const knob = document.getElementById('shopActivateKnob');
    const hiddenInput = document.getElementById('shopActivated');

    let isOn = button.getAttribute('aria-checked') === 'true';

    if (isOn) {
        button.setAttribute('aria-checked', 'false');
        button.classList.remove('bg-violet-500');
        button.classList.add('bg-gray-200');
        knob.classList.remove('translate-x-5');
        knob.classList.add('translate-x-0');
        hiddenInput.value = 'false';
    } else {
        button.setAttribute('aria-checked', 'true');
        button.classList.remove('bg-gray-200');
        button.classList.add('bg-violet-500');
        knob.classList.remove('translate-x-0');
        knob.classList.add('translate-x-5');
        hiddenInput.value = 'true';
    }
}
