<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./static/css/tailwind.css"/>
        <style>
            <%@include file="./static/css/tailwind.css" %>
        </style>
        <title>Category</title>
    </head>
    <body>
        <div class="bg-white">
            <div class="border-b border-gray-200">
                <nav aria-label="Breadcrumb" class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <ol role="list" class="flex items-center space-x-4 py-4">
                        <li>
                            <div class="flex items-center">
                                <a href="#" class="mr-4 text-sm font-medium text-gray-900">Men</a>
                                <svg viewBox="0 0 6 20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                                     class="h-5 w-auto text-gray-300">
                                    <path d="M4.878 4.34H3.551L.27 16.532h1.327l3.281-12.19z"
                                          fill="currentColor"></path>
                                </svg>
                            </div>
                        </li>
                        
                        <li class="text-sm">
                            <a href="#" aria-current="page" class="font-medium text-gray-500 hover:text-gray-600">New
                                Arrivals</a>
                        </li>
                    </ol>
                </nav>
            </div>
            
            <main class="mx-auto max-w-2xl px-4 lg:max-w-7xl lg:px-8">
                <div class="flex items-baseline justify-between border-b border-gray-200 pt-24 pb-10">
                    <div>
                        <h1 class="text-4xl font-bold tracking-tight text-gray-900">New Arrivals</h1>
                        <p class="mt-4 text-base text-gray-500">Checkout out the latest release of Basic Tees, new and
                            improved with four openings!</p>
                    </div>
                    <div class="flex items-center">
                        <div class="relative inline-block text-left">
                            <div>
                                <button type="button"
                                        class="group inline-flex justify-center text-sm font-medium text-gray-700 hover:text-gray-900"
                                        id="menu-button" aria-expanded="false" aria-haspopup="true">
                                    Sort
                                    <!-- Heroicon name: mini/chevron-down -->
                                    <svg class="-mr-1 ml-1 h-5 w-5 flex-shrink-0 text-gray-400 group-hover:text-gray-500"
                                         xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                                         aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z"
                                              clip-rule="evenodd"></path>
                                    </svg>
                                </button>
                            </div>
                            
                            <!--
                              Dropdown menu, show/hide based on menu state.
                
                              Entering: "transition ease-out duration-100"
                                From: "transform opacity-0 scale-95"
                                To: "transform opacity-100 scale-100"
                              Leaving: "transition ease-in duration-75"
                                From: "transform opacity-100 scale-100"
                                To: "transform opacity-0 scale-95"
                            -->
                            <div class="absolute right-0 z-10 mt-2 w-40 origin-top-right rounded-md bg-white shadow-2xl ring-1 ring-black ring-opacity-5 focus:outline-none"
                                 role="menu" aria-orientation="vertical" aria-labelledby="menu-button" tabindex="-1">
                                <div class="py-1" role="none">
                                    <!--
                                      Active: "bg-gray-100", Not Active: ""
                    
                                      Selected: "font-medium text-gray-900", Not Selected: "text-gray-500"
                                    -->
                                    <a href="#" class="font-medium text-gray-900 block px-4 py-2 text-sm"
                                       role="menuitem" tabindex="-1" id="menu-item-0">Most Popular</a>
                                    
                                    <a href="#" class="text-gray-500 block px-4 py-2 text-sm" role="menuitem"
                                       tabindex="-1" id="menu-item-1">Best Rating</a>
                                    
                                    <a href="#" class="text-gray-500 block px-4 py-2 text-sm" role="menuitem"
                                       tabindex="-1" id="menu-item-2">Newest</a>
                                    
                                    <a href="#" class="text-gray-500 block px-4 py-2 text-sm" role="menuitem"
                                       tabindex="-1" id="menu-item-3">Price: Low to High</a>
                                    
                                    <a href="#" class="text-gray-500 block px-4 py-2 text-sm" role="menuitem"
                                       tabindex="-1" id="menu-item-4">Price: High to Low</a>
                                </div>
                            </div>
                        </div>
                    
                    
                    </div>
                </div>
                
                <div class="pt-12 pb-24 lg:grid lg:grid-cols-3 lg:gap-x-8 xl:grid-cols-4">
                    <aside>
                        <h2 class="sr-only">Filters</h2>
                        
                        <!-- Mobile filter dialog toggle, controls the 'mobileFilterDialogOpen' state. -->
                        <button type="button" class="inline-flex items-center lg:hidden">
                            <span class="text-sm font-medium text-gray-700">Filters</span>
                            <!-- Heroicon name: mini/plus -->
                            <svg class="ml-1 h-5 w-5 flex-shrink-0 text-gray-400" xmlns="http://www.w3.org/2000/svg"
                                 viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                <path d="M10.75 4.75a.75.75 0 00-1.5 0v4.5h-4.5a.75.75 0 000 1.5h4.5v4.5a.75.75 0 001.5 0v-4.5h4.5a.75.75 0 000-1.5h-4.5v-4.5z"></path>
                            </svg>
                        </button>
                        
                        <div class="hidden lg:block">
                            <form class="space-y-10 divide-y divide-gray-200">
                                <div>
                                    <fieldset>
                                        <legend class="block text-sm font-medium text-gray-900">Color</legend>
                                        <div class="space-y-3 pt-6">
                                            <div class="flex items-center">
                                                <input id="color-0" name="color[]" value="white" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="color-0"
                                                       class="ml-3 text-sm text-gray-600">White</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="color-1" name="color[]" value="beige" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="color-1"
                                                       class="ml-3 text-sm text-gray-600">Beige</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="color-2" name="color[]" value="blue" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="color-2" class="ml-3 text-sm text-gray-600">Blue</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="color-3" name="color[]" value="brown" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="color-3"
                                                       class="ml-3 text-sm text-gray-600">Brown</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="color-4" name="color[]" value="green" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="color-4"
                                                       class="ml-3 text-sm text-gray-600">Green</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="color-5" name="color[]" value="purple" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="color-5"
                                                       class="ml-3 text-sm text-gray-600">Purple</label>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                
                                <div class="pt-10">
                                    <fieldset>
                                        <legend class="block text-sm font-medium text-gray-900">Category</legend>
                                        <div class="space-y-3 pt-6">
                                            <div class="flex items-center">
                                                <input id="category-0" name="category[]" value="new-arrivals"
                                                       type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="category-0" class="ml-3 text-sm text-gray-600">All New
                                                    Arrivals</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="category-1" name="category[]" value="tees"
                                                       type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="category-1"
                                                       class="ml-3 text-sm text-gray-600">Tees</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="category-2" name="category[]" value="crewnecks"
                                                       type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="category-2"
                                                       class="ml-3 text-sm text-gray-600">Crewnecks</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="category-3" name="category[]" value="sweatshirts"
                                                       type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="category-3"
                                                       class="ml-3 text-sm text-gray-600">Sweatshirts</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="category-4" name="category[]" value="pants-shorts"
                                                       type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="category-4" class="ml-3 text-sm text-gray-600">Pants
                                                    &amp; Shorts</label>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                
                                <div class="pt-10">
                                    <fieldset>
                                        <legend class="block text-sm font-medium text-gray-900">Sizes</legend>
                                        <div class="space-y-3 pt-6">
                                            <div class="flex items-center">
                                                <input id="sizes-0" name="sizes[]" value="xs" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="sizes-0" class="ml-3 text-sm text-gray-600">XS</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="sizes-1" name="sizes[]" value="s" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="sizes-1" class="ml-3 text-sm text-gray-600">S</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="sizes-2" name="sizes[]" value="m" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="sizes-2" class="ml-3 text-sm text-gray-600">M</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="sizes-3" name="sizes[]" value="l" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="sizes-3" class="ml-3 text-sm text-gray-600">L</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="sizes-4" name="sizes[]" value="xl" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="sizes-4" class="ml-3 text-sm text-gray-600">XL</label>
                                            </div>
                                            
                                            <div class="flex items-center">
                                                <input id="sizes-5" name="sizes[]" value="2xl" type="checkbox"
                                                       class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                                <label for="sizes-5" class="ml-3 text-sm text-gray-600">2XL</label>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </form>
                        </div>
                    </aside>
                    
                    <section aria-labelledby="product-heading" class="mt-6 lg:col-span-2 lg:mt-0 xl:col-span-3">
                        <h2 id="product-heading" class="sr-only">Products</h2>
                        
                        <div class="grid grid-cols-1 gap-y-4 sm:grid-cols-2 sm:gap-x-6 sm:gap-y-10 lg:gap-x-8 xl:grid-cols-3">
                            <div class="group relative flex flex-col overflow-hidden rounded-lg border border-gray-200 bg-white">
                                <div class="aspect-w-3 aspect-h-4 bg-gray-200 group-hover:opacity-75 sm:aspect-none sm:h-96">
                                    <img src="https://tailwindui.com/img/ecommerce-images/category-page-02-image-card-01.jpg"
                                         alt="Eight shirts arranged on table in black, olive, grey, blue, white, red, mustard, and green."
                                         class="h-full w-full object-cover object-center sm:h-full sm:w-full">
                                </div>
                                <div class="flex flex-1 flex-col space-y-2 p-4">
                                    <h3 class="text-sm font-medium text-gray-900">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            Basic Tee 8-Pack
                                        </a>
                                    </h3>
                                    <p class="text-sm text-gray-500">Get the full lineup of our Basic Tees. Have a
                                        fresh shirt all week, and an extra for laundry day.</p>
                                    <div class="flex flex-1 flex-col justify-end">
                                        <p class="text-sm italic text-gray-500">8 colors</p>
                                        <p class="text-base font-medium text-gray-900">$256</p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="group relative flex flex-col overflow-hidden rounded-lg border border-gray-200 bg-white">
                                <div class="aspect-w-3 aspect-h-4 bg-gray-200 group-hover:opacity-75 sm:aspect-none sm:h-96">
                                    <img src="https://tailwindui.com/img/ecommerce-images/category-page-02-image-card-02.jpg"
                                         alt="Front of plain black t-shirt."
                                         class="h-full w-full object-cover object-center sm:h-full sm:w-full">
                                </div>
                                <div class="flex flex-1 flex-col space-y-2 p-4">
                                    <h3 class="text-sm font-medium text-gray-900">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            Basic Tee
                                        </a>
                                    </h3>
                                    <p class="text-sm text-gray-500">Look like a visionary CEO and wear the same
                                        black t-shirt every day.</p>
                                    <div class="flex flex-1 flex-col justify-end">
                                        <p class="text-sm italic text-gray-500">Black</p>
                                        <p class="text-base font-medium text-gray-900">$32</p>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- More products... -->
                        </div>
                    </section>
                </div>
                
                <!-- Pagination -->
                <nav aria-label="Pagination"
                     class="mx-auto mt-6 flex max-w-7xl justify-between px-4 text-sm font-medium text-gray-700 sm:px-6 lg:px-8">
                    <div class="min-w-0 flex-1">
                        <a href="#"
                           class="inline-flex h-10 items-center rounded-md border border-gray-300 bg-white px-4 hover:bg-gray-100 focus:border-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-opacity-25 focus:ring-offset-1 focus:ring-offset-indigo-600">Previous</a>
                    </div>
                    <div class="hidden space-x-2 sm:flex">
                        <!-- Current: "border-indigo-600 ring-1 ring-indigo-600", Default: "border-gray-300" -->
                        <a href="#"
                           class="inline-flex h-10 items-center rounded-md border border-gray-300 bg-white px-4 hover:bg-gray-100 focus:border-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-opacity-25 focus:ring-offset-1 focus:ring-offset-indigo-600">1</a>
                        <a href="#"
                           class="inline-flex h-10 items-center rounded-md border border-gray-300 bg-white px-4 hover:bg-gray-100 focus:border-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-opacity-25 focus:ring-offset-1 focus:ring-offset-indigo-600">2</a>
                        <a href="#"
                           class="inline-flex h-10 items-center rounded-md border border-indigo-600 bg-white px-4 ring-1 ring-indigo-600 hover:bg-gray-100 focus:border-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-opacity-25 focus:ring-offset-1 focus:ring-offset-indigo-600">3</a>
                        <span class="inline-flex h-10 items-center px-1.5 text-gray-500">...</span>
                        <a href="#"
                           class="inline-flex h-10 items-center rounded-md border border-gray-300 bg-white px-4 hover:bg-gray-100 focus:border-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-opacity-25 focus:ring-offset-1 focus:ring-offset-indigo-600">8</a>
                        <a href="#"
                           class="inline-flex h-10 items-center rounded-md border border-gray-300 bg-white px-4 hover:bg-gray-100 focus:border-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-opacity-25 focus:ring-offset-1 focus:ring-offset-indigo-600">9</a>
                        <a href="#"
                           class="inline-flex h-10 items-center rounded-md border border-gray-300 bg-white px-4 hover:bg-gray-100 focus:border-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-opacity-25 focus:ring-offset-1 focus:ring-offset-indigo-600">10</a>
                    </div>
                    <div class="flex min-w-0 flex-1 justify-end">
                        <a href="#"
                           class="inline-flex h-10 items-center rounded-md border border-gray-300 bg-white px-4 hover:bg-gray-100 focus:border-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-opacity-25 focus:ring-offset-1 focus:ring-offset-indigo-600">Next</a>
                    </div>
                </nav>
            </main>
            
            <footer aria-labelledby="footer-heading" class="border-t border-gray-200 bg-white">
                <h2 id="footer-heading" class="sr-only">Footer</h2>
                <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div class="py-20">
                        <div class="grid grid-cols-1 md:grid-flow-col md:auto-rows-min md:grid-cols-12 md:gap-x-8 md:gap-y-16">
                            <!-- Image section -->
                            <div class="col-span-1 md:col-span-2 lg:col-start-1 lg:row-start-1">
                                <img src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600" alt=""
                                     class="h-8 w-auto">
                            </div>
                            
                            <!-- Sitemap sections -->
                            <div class="col-span-6 mt-10 grid grid-cols-2 gap-8 sm:grid-cols-3 md:col-span-8 md:col-start-3 md:row-start-1 md:mt-0 lg:col-span-6 lg:col-start-2">
                                <div class="grid grid-cols-1 gap-y-12 sm:col-span-2 sm:grid-cols-2 sm:gap-x-8">
                                    <div>
                                        <h3 class="text-sm font-medium text-gray-900">Products</h3>
                                        <ul role="list" class="mt-6 space-y-6">
                                            <li class="text-sm">
                                                <a href="#" class="text-gray-500 hover:text-gray-600">Bags</a>
                                            </li>
                                            
                                            <li class="text-sm">
                                                <a href="#" class="text-gray-500 hover:text-gray-600">Tees</a>
                                            </li>
                                            
                                            <li class="text-sm">
                                                <a href="#" class="text-gray-500 hover:text-gray-600">Objects</a>
                                            </li>
                                            
                                            <li class="text-sm">
                                                <a href="#" class="text-gray-500 hover:text-gray-600">Home Goods</a>
                                            </li>
                                            
                                            <li class="text-sm">
                                                <a href="#"
                                                   class="text-gray-500 hover:text-gray-600">Accessories</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div>
                                        <h3 class="text-sm font-medium text-gray-900">Company</h3>
                                        <ul role="list" class="mt-6 space-y-6">
                                            <li class="text-sm">
                                                <a href="#" class="text-gray-500 hover:text-gray-600">Who we are</a>
                                            </li>
                                            
                                            <li class="text-sm">
                                                <a href="#"
                                                   class="text-gray-500 hover:text-gray-600">Sustainability</a>
                                            </li>
                                            
                                            <li class="text-sm">
                                                <a href="#" class="text-gray-500 hover:text-gray-600">Press</a>
                                            </li>
                                            
                                            <li class="text-sm">
                                                <a href="#" class="text-gray-500 hover:text-gray-600">Careers</a>
                                            </li>
                                            
                                            <li class="text-sm">
                                                <a href="#" class="text-gray-500 hover:text-gray-600">Terms &amp;
                                                    Conditions</a>
                                            </li>
                                            
                                            <li class="text-sm">
                                                <a href="#" class="text-gray-500 hover:text-gray-600">Privacy</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div>
                                    <h3 class="text-sm font-medium text-gray-900">Customer Service</h3>
                                    <ul role="list" class="mt-6 space-y-6">
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-500 hover:text-gray-600">Contact</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-500 hover:text-gray-600">Shipping</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-500 hover:text-gray-600">Returns</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-500 hover:text-gray-600">Warranty</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-500 hover:text-gray-600">Secure
                                                Payments</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-500 hover:text-gray-600">FAQ</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-500 hover:text-gray-600">Find a store</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <!-- Newsletter section -->
                            <div class="mt-12 md:col-span-8 md:col-start-3 md:row-start-2 md:mt-0 lg:col-span-4 lg:col-start-9 lg:row-start-1">
                                <h3 class="text-sm font-medium text-gray-900">Sign up for our newsletter</h3>
                                <p class="mt-6 text-sm text-gray-500">The latest deals and savings, sent to your
                                    inbox weekly.</p>
                                <form class="mt-2 flex sm:max-w-md">
                                    <label for="email-address" class="sr-only">Email address</label>
                                    <input id="email-address" type="text" autocomplete="email" required
                                           class="w-full min-w-0 appearance-none rounded-md border border-gray-300 bg-white py-2 px-4 text-base text-gray-900 placeholder-gray-500 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500">
                                    <div class="ml-4 flex-shrink-0">
                                        <button type="submit"
                                                class="flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                                            Sign up
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <div class="border-t border-gray-100 py-10 text-center">
                        <p class="text-sm text-gray-500">&copy; 2021 Your Company, Inc. All rights reserved.</p>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>
