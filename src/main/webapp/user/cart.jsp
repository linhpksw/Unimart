<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product</title>
        <link rel="stylesheet" href="../static/css/tailwind.css"/>
        <style>
            <%@include file="../static/css/tailwind.css" %>
        </style>
    
    </head>
    <body>
        <div class="bg-white">
            
            <main class="mx-auto max-w-2xl px-4 pt-16 pb-24 sm:px-6 lg:max-w-7xl lg:px-8">
                <h1 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Shopping Cart</h1>
                
                <form class="mt-12 lg:grid lg:grid-cols-12 lg:items-start lg:gap-x-12 xl:gap-x-16">
                    <section aria-labelledby="cart-heading" class="lg:col-span-7">
                        <h2 id="cart-heading" class="sr-only">Items in your shopping cart</h2>
                        
                        <div class="flex items-start mb-4">
                            <div class="flex h-5 items-center">
                                <input id="comments" aria-describedby="comments-description" name="comments"
                                       type="checkbox"
                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                            </div>
                            <div class="ml-3">
                                <label for="comments" class="font-medium text-gray-700">Select all items</label>
                                
                                <a href="#" class="ml-5 font-medium text-red-700 hover:underline">Delete
                                    selected items</a>
                            </div>
                        </div>
                        
                        <ul role="list" class="divide-y divide-gray-200 border-t border-b border-gray-200">
                            <li class="flex py-6 sm:py-10">
                                <div class="flex-shrink-0">
                                    <img src="https://tailwindui.com/img/ecommerce-images/shopping-cart-page-01-product-01.jpg"
                                         alt="Front of men&#039;s Basic Tee in sienna."
                                         class="h-24 w-24 rounded-md object-cover object-center sm:h-48 sm:w-48">
                                </div>
                                
                                <div class="ml-4 flex flex-1 flex-col justify-between sm:ml-6">
                                    <div class="relative flex gap-[6rem] pr-9">
                                        <div>
                                            <div class="flex justify-between">
                                                <h3 class="text-sm">
                                                    <a href="#" class="font-medium text-gray-700 hover:text-gray-800">Basic
                                                        Tee</a>
                                                </h3>
                                            </div>
                                            <div class="mt-1 flex text-sm">
                                                <p class="text-gray-500">Sienna</p>
                                                
                                                <p class="ml-4 border-l border-gray-200 pl-4 text-gray-500">Large</p>
                                            </div>
                                            <p class="mt-1 text-sm font-medium text-gray-900">$32.00</p>
                                        </div>
                                        
                                        <div class="mt-4 mt-0 pr-9">
                                            <div class="flex text-gray-700">
                                                <!-- Decrement button -->
                                                <button type="button" id="decrement-button"
                                                        data-input-counter-decrement="quantity-input"
                                                        class="bg-gray-100 hover:bg-gray-200 border border-gray-300 rounded-s-lg p-3 h-11 focus:ring-gray-100 focus:ring-2 focus:outline-none">
                                                    <svg class="w-3 h-3 text-gray-900"
                                                         aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                         fill="none" viewBox="0 0 18 2">
                                                        <path stroke="currentColor" stroke-linecap="round"
                                                              stroke-linejoin="round" stroke-width="2"
                                                              d="M1 1h16"></path>
                                                    </svg>
                                                </button>
                                                
                                                <!-- Quantity display -->
                                                <input type="text" id="quantity-input" data-input-counter
                                                       aria-describedby="helper-text-explanation"
                                                       class="w-12 bg-gray-50 border-x-0 border-gray-300 h-11 text-center text-gray-900 text-sm focus:ring-blue-500 focus:border-blue-500 block py-2.5"
                                                       placeholder="999" required/>
                                                
                                                <!-- Increment button -->
                                                <button type="button" id="increment-button"
                                                        data-input-counter-increment="quantity-input"
                                                        class="bg-gray-100 dark:bg-gray-700 hover:bg-gray-200 border border-gray-300 rounded-e-lg p-3 h-11 focus:ring-gray-100 focus:ring-2 focus:outline-none">
                                                    <svg class="w-3 h-3 text-gray-900"
                                                         aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                         fill="none" viewBox="0 0 18 18">
                                                        <path stroke="currentColor" stroke-linecap="round"
                                                              stroke-linejoin="round" stroke-width="2"
                                                              d="M9 1v16M1 9h16"></path>
                                                    </svg>
                                                </button>
                                            </div>
                                            
                                            <div class="absolute top-0 right-0">
                                                <button type="button"
                                                        class="-m-2 inline-flex p-2 text-gray-400 hover:text-gray-500">
                                                    <span class="sr-only">Remove</span>
                                                    <!-- Heroicon name: mini/x-mark -->
                                                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg"
                                                         viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                        <path d="M6.28 5.22a.75.75 0 00-1.06 1.06L8.94 10l-3.72 3.72a.75.75 0 101.06 1.06L10 11.06l3.72 3.72a.75.75 0 101.06-1.06L11.06 10l3.72-3.72a.75.75 0 00-1.06-1.06L10 8.94 6.28 5.22z"/>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <p class="mt-4 flex space-x-2 text-sm text-gray-700">
                                        <!-- Heroicon name: mini/check -->
                                        <svg class="h-5 w-5 flex-shrink-0 text-green-500"
                                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                                             aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z"
                                                  clip-rule="evenodd"/>
                                        </svg>
                                        <span>In stock</span>
                                    </p>
                                </div>
                            </li>
                            
                            <li class="flex py-6 sm:py-10">
                                <div class="flex-shrink-0">
                                    <img src="https://tailwindui.com/img/ecommerce-images/shopping-cart-page-01-product-02.jpg"
                                         alt="Front of men&#039;s Basic Tee in black."
                                         class="h-24 w-24 rounded-md object-cover object-center sm:h-48 sm:w-48">
                                </div>
                                
                                <div class="ml-4 flex flex-1 flex-col justify-between sm:ml-6">
                                    <div class="relative pr-9 sm:grid sm:grid-cols-2 sm:gap-x-6 sm:pr-0">
                                        <div>
                                            <div class="flex justify-between">
                                                <h3 class="text-sm">
                                                    <a href="#" class="font-medium text-gray-700 hover:text-gray-800">Basic
                                                        Tee</a>
                                                </h3>
                                            </div>
                                            <div class="mt-1 flex text-sm">
                                                <p class="text-gray-500">Black</p>
                                                
                                                <p class="ml-4 border-l border-gray-200 pl-4 text-gray-500">Large</p>
                                            </div>
                                            <p class="mt-1 text-sm font-medium text-gray-900">$32.00</p>
                                        </div>
                                        
                                        <div class="mt-4 sm:mt-0 sm:pr-9">
                                            <label for="quantity-1" class="sr-only">Quantity, Basic Tee</label>
                                            <select id="quantity-1" name="quantity-1"
                                                    class="max-w-full rounded-md border border-gray-300 py-1.5 text-left text-base font-medium leading-5 text-gray-700 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500 sm:text-sm">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                            </select>
                                            
                                            <div class="absolute top-0 right-0">
                                                <button type="button"
                                                        class="-m-2 inline-flex p-2 text-gray-400 hover:text-gray-500">
                                                    <span class="sr-only">Remove</span>
                                                    <!-- Heroicon name: mini/x-mark -->
                                                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg"
                                                         viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                        <path d="M6.28 5.22a.75.75 0 00-1.06 1.06L8.94 10l-3.72 3.72a.75.75 0 101.06 1.06L10 11.06l3.72 3.72a.75.75 0 101.06-1.06L11.06 10l3.72-3.72a.75.75 0 00-1.06-1.06L10 8.94 6.28 5.22z"/>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <p class="mt-4 flex space-x-2 text-sm text-gray-700">
                                        <!-- Heroicon name: mini/clock -->
                                        <svg class="h-5 w-5 flex-shrink-0 text-gray-300"
                                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                                             aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10 18a8 8 0 100-16 8 8 0 000 16zm.75-13a.75.75 0 00-1.5 0v5c0 .414.336.75.75.75h4a.75.75 0 000-1.5h-3.25V5z"
                                                  clip-rule="evenodd"/>
                                        </svg>
                                        <span>Ships in 3–4 weeks</span>
                                    </p>
                                </div>
                            </li>
                        
                        </ul>
                    </section>
                    
                    <!-- Order summary -->
                    <section aria-labelledby="summary-heading"
                             class="mt-16 rounded-lg bg-gray-50 px-4 py-6 sm:p-6 lg:col-span-5 lg:mt-0 lg:p-8">
                        <h2 id="summary-heading" class="text-lg font-medium text-gray-900">Order summary</h2>
                        
                        <dl class="mt-6 space-y-4">
                            <div class="flex items-center justify-between">
                                <dt class="text-sm text-gray-600">Subtotal</dt>
                                <dd class="text-sm font-medium text-gray-900">$99.00</dd>
                            </div>
                            <div class="flex items-center justify-between border-t border-gray-200 pt-4">
                                <dt class="flex items-center text-sm text-gray-600">
                                    <span>Shipping estimate</span>
                                    <a href="#" class="ml-2 flex-shrink-0 text-gray-400 hover:text-gray-500">
                                        <span class="sr-only">Learn more about how shipping is calculated</span>
                                        <!-- Heroicon name: mini/question-mark-circle -->
                                        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                             fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zM8.94 6.94a.75.75 0 11-1.061-1.061 3 3 0 112.871 5.026v.345a.75.75 0 01-1.5 0v-.5c0-.72.57-1.172 1.081-1.287A1.5 1.5 0 108.94 6.94zM10 15a1 1 0 100-2 1 1 0 000 2z"
                                                  clip-rule="evenodd"/>
                                        </svg>
                                    </a>
                                </dt>
                                <dd class="text-sm font-medium text-gray-900">$5.00</dd>
                            </div>
                            <div class="flex items-center justify-between border-t border-gray-200 pt-4">
                                <dt class="flex text-sm text-gray-600">
                                    <span>Tax estimate</span>
                                    <a href="#" class="ml-2 flex-shrink-0 text-gray-400 hover:text-gray-500">
                                        <span class="sr-only">Learn more about how tax is calculated</span>
                                        <!-- Heroicon name: mini/question-mark-circle -->
                                        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                             fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zM8.94 6.94a.75.75 0 11-1.061-1.061 3 3 0 112.871 5.026v.345a.75.75 0 01-1.5 0v-.5c0-.72.57-1.172 1.081-1.287A1.5 1.5 0 108.94 6.94zM10 15a1 1 0 100-2 1 1 0 000 2z"
                                                  clip-rule="evenodd"/>
                                        </svg>
                                    </a>
                                </dt>
                                <dd class="text-sm font-medium text-gray-900">$8.32</dd>
                            </div>
                            <div class="flex items-center justify-between border-t border-gray-200 pt-4">
                                <dt class="text-base font-medium text-gray-900">Order total</dt>
                                <dd class="text-base font-medium text-gray-900">$112.32</dd>
                            </div>
                        </dl>
                        
                        <div class="mt-6">
                            <button type="submit"
                                    class="w-full rounded-md border border-transparent bg-indigo-600 py-3 px-4 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50">
                                Checkout
                            </button>
                        </div>
                    </section>
                </form>
                
                <!-- Related products -->
                <section aria-labelledby="related-heading" class="mt-24">
                    <h2 id="related-heading" class="text-lg font-medium text-gray-900">You may also like&hellip;</h2>
                    
                    <div class="mt-6 grid grid-cols-1 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8">
                        <div class="group relative">
                            <div class="min-h-80 aspect-w-1 aspect-h-1 w-full overflow-hidden rounded-md group-hover:opacity-75 lg:aspect-none lg:h-80">
                                <img src="https://tailwindui.com/img/ecommerce-images/shopping-cart-page-01-related-product-01.jpg"
                                     alt="Front of Billfold Wallet in natural leather."
                                     class="h-full w-full object-cover object-center lg:h-full lg:w-full">
                            </div>
                            <div class="mt-4 flex justify-between">
                                <div>
                                    <h3 class="text-sm text-gray-700">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            Billfold Wallet
                                        </a>
                                    </h3>
                                    <p class="mt-1 text-sm text-gray-500">Natural</p>
                                </div>
                                <p class="text-sm font-medium text-gray-900">$118</p>
                            </div>
                        </div>
                        
                        <!-- More products... -->
                    </div>
                </section>
            </main>
        
        
        </div>
    </body>
</html>
