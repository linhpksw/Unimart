<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Unimart</title>
        <link rel="stylesheet" href="./static/css/tailwind.css"/>
        <style>
            <%@include file="./static/css/tailwind.css" %>
        </style>
    </head>
    <body>
        <div class="bg-white">
            <!-- Hero section -->
            <div class="relative bg-gray-900">
                <!-- Decorative image and overlay -->
                <div aria-hidden="true" class="absolute inset-0 overflow-hidden">
                    <img src="https://tailwindui.com/img/ecommerce-images/home-page-01-hero-full-width.jpg" alt=""
                         class="h-full w-full object-cover object-center">
                </div>
                <div aria-hidden="true" class="absolute inset-0 bg-gray-900 opacity-50"></div>
                
                <!-- Navigation -->
                <header class="relative z-10">
                    <nav aria-label="Top">
                        <!-- Top navigation -->
                        <div class="bg-gray-900">
                            <div class="mx-auto flex h-10 max-w-7xl items-center justify-between px-4 sm:px-6 lg:px-8">
                                <!-- Currency selector -->
                                <form>
                                    <div>
                                        <label for="desktop-currency" class="sr-only">Currency</label>
                                        <div class="group relative -ml-2 rounded-md border-transparent bg-gray-900 focus-within:ring-2 focus-within:ring-white">
                                            <select id="desktop-currency" name="currency"
                                                    class="flex items-center rounded-md border-transparent bg-gray-900 bg-none py-0.5 pl-2 pr-5 text-sm font-medium text-white focus:border-transparent focus:outline-none focus:ring-0 group-hover:text-gray-100">
                                                <option>English</option>
                                                
                                                <option>Tiếng Việt</option>
                                            
                                            </select>
                                            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center">
                                                <!-- Heroicon name: mini/chevron-down -->
                                                <svg class="h-5 w-5 text-gray-300" xmlns="http://www.w3.org/2000/svg"
                                                     viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                    <path fill-rule="evenodd"
                                                          d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z"
                                                          clip-rule="evenodd"></path>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                
                                <div class="flex items-center space-x-6">
                                    <a href="login" class="text-sm font-medium text-white hover:text-gray-100">Sign
                                        in</a>
                                    <a href="signup" class="text-sm font-medium text-white hover:text-gray-100">Create
                                        an
                                        account</a>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Secondary navigation -->
                        <div class="bg-white bg-opacity-10 backdrop-blur-md backdrop-filter">
                            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                                <div>
                                    <div class="flex h-16 items-center justify-between">
                                        <!-- Logo (lg+) -->
                                        <div class="hidden lg:flex lg:flex-1 lg:items-center">
                                            <a href="#">
                                                <span class="sr-only">Your Company</span>
                                                <img class="h-8 w-auto"
                                                     src="https://tailwindui.com/img/logos/mark.svg?color=white" alt="">
                                            </a>
                                        </div>
                                        
                                        <div>
                                            
                                            <form class="w-96 mx-auto">
                                                <label for="default-search"
                                                       class="mb-2 font-medium text-gray-900 sr-only ">Search</label>
                                                <div class="relative">
                                                    <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                                                        <svg class="w-4 h-4 text-gray-500 "
                                                             aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                             fill="none" viewBox="0 0 20 20">
                                                            <path stroke="currentColor" stroke-linecap="round"
                                                                  stroke-linejoin="round" stroke-width="2"
                                                                  d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"></path>
                                                        </svg>
                                                    </div>
                                                    <input type="search" id="default-search"
                                                           class="block w-full px-4 py-3 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 "
                                                           placeholder="Search Mockups, Logos..." required/>
                                                    <button type="submit"
                                                            class="text-white absolute end-2.5 bottom-1.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 ">
                                                        Search
                                                    </button>
                                                </div>
                                            </form>
                                        
                                        </div>
                                        
                                        
                                        <div class="flex flex-1 items-center justify-end">
                                            <a href="#"
                                               class="hidden text-sm font-medium text-white lg:block">Search</a>
                                            
                                            <div class="flex items-center lg:ml-8">
                                                <!-- Help -->
                                                <a href="#" class="p-2 text-white lg:hidden">
                                                    <span class="sr-only">Help</span>
                                                    <!-- Heroicon name: outline/question-mark-circle -->
                                                    <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none"
                                                         viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                                                         aria-hidden="true">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              d="M9.879 7.519c1.171-1.025 3.071-1.025 4.242 0 1.172 1.025 1.172 2.687 0 3.712-.203.179-.43.326-.67.442-.745.361-1.45.999-1.45 1.827v.75M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9 5.25h.008v.008H12v-.008z"></path>
                                                    </svg>
                                                </a>
                                                <a href="#"
                                                   class="hidden text-sm font-medium text-white lg:block">Help</a>
                                                
                                                <!-- Cart -->
                                                <div class="ml-4 flow-root lg:ml-8">
                                                    <a href="#" class="group -m-2 flex items-center p-2">
                                                        <!-- Heroicon name: outline/shopping-bag -->
                                                        <svg class="h-6 w-6 flex-shrink-0 text-white"
                                                             xmlns="http://www.w3.org/2000/svg" fill="none"
                                                             viewBox="0 0 24 24" stroke-width="1.5"
                                                             stroke="currentColor" aria-hidden="true">
                                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                                  d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z"></path>
                                                        </svg>
                                                        <span class="ml-2 text-sm font-medium text-white">0</span>
                                                        <span class="sr-only">items in cart, view bag</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </header>
                
                <div class="relative mx-auto flex max-w-3xl flex-col items-center py-32 px-6 text-center sm:py-64 lg:px-0">
                    <h1 class="text-4xl font-bold tracking-tight text-white lg:text-6xl">New arrivals are here</h1>
                    <p class="mt-4 text-xl text-white">The new arrivals have, well, newly arrived. Check out the latest
                        options from our summer small-batch release while they're still in stock.</p>
                    <a href="#"
                       class="mt-8 inline-block rounded-md border border-transparent bg-white py-3 px-8 text-base font-medium text-gray-900 hover:bg-gray-100">Shop
                        New Arrivals</a>
                </div>
            </div>
            
            <main>
                <!-- Category section -->
                <section aria-labelledby="category-heading" class="pt-24 mx-auto max-w-7xl px-8">
                    <div class="px-4 flex items-center justify-between px-8">
                        <h2 id="category-heading" class="text-2xl font-bold tracking-tight text-gray-900">Shop by
                            Category</h2>
                        <a href="#" class="text-sm font-semibold text-indigo-600 hover:text-indigo-500 block">
                            Browse all categories
                            <span aria-hidden="true"> &rarr;</span>
                        </a>
                    </div>
                    
                    <div class="mt-4 flow-root">
                        <div class="-my-2">
                            <div class="relative box-content h-[10rem] py-2 overflow-visible">
                                <div class="min-w-screen-xl space-x-8 relative grid grid-cols-8 gap-x-8 space-x-0 px-8">
                                    <a href="#"
                                       class="relative flex h-[10rem] flex-col overflow-hidden rounded-lg p-6 hover:opacity-75 w-auto">
                <span aria-hidden="true" class="absolute inset-0">
                  <img src="https://tailwindui.com/img/ecommerce-images/home-page-01-category-01.jpg" alt=""
                       class="h-full w-full object-cover object-center">
                </span>
                                        <span aria-hidden="true"
                                              class="absolute inset-x-0 bottom-0 h-2/3 bg-gradient-to-t from-gray-800 opacity-50"></span>
                                        <span class="relative mt-auto text-center text-xl font-bold text-white">New Arrivals</span>
                                    </a>
                                    
                                    <a href="#"
                                       class="relative flex h-[10rem] flex-col overflow-hidden rounded-lg p-6 hover:opacity-75 w-auto">
                <span aria-hidden="true" class="absolute inset-0">
                  <img src="https://tailwindui.com/img/ecommerce-images/home-page-01-category-02.jpg" alt=""
                       class="h-full w-full object-cover object-center">
                </span>
                                        <span aria-hidden="true"
                                              class="absolute inset-x-0 bottom-0 h-2/3 bg-gradient-to-t from-gray-800 opacity-50"></span>
                                        <span class="relative mt-auto text-center text-xl font-bold text-white">Productivity</span>
                                    </a>
                                    
                                    <a href="#"
                                       class="relative flex h-[10rem] flex-col overflow-hidden rounded-lg p-6 hover:opacity-75 w-auto">
                <span aria-hidden="true" class="absolute inset-0">
                  <img src="https://tailwindui.com/img/ecommerce-images/home-page-01-category-04.jpg" alt=""
                       class="h-full w-full object-cover object-center">
                </span>
                                        <span aria-hidden="true"
                                              class="absolute inset-x-0 bottom-0 h-2/3 bg-gradient-to-t from-gray-800 opacity-50"></span>
                                        <span class="relative mt-auto text-center text-xl font-bold text-white">Workspace</span>
                                    </a>
                                    
                                    <a href="#"
                                       class="relative flex h-[10rem] flex-col overflow-hidden rounded-lg p-6 hover:opacity-75 w-auto">
                <span aria-hidden="true" class="absolute inset-0">
                  <img src="https://tailwindui.com/img/ecommerce-images/home-page-01-category-05.jpg" alt=""
                       class="h-full w-full object-cover object-center">
                </span>
                                        <span aria-hidden="true"
                                              class="absolute inset-x-0 bottom-0 h-2/3 bg-gradient-to-t from-gray-800 opacity-50"></span>
                                        <span class="relative mt-auto text-center text-xl font-bold text-white">Accessories</span>
                                    </a>
                                    
                                    <a href="#"
                                       class="relative flex h-[10rem] flex-col overflow-hidden rounded-lg p-6 hover:opacity-75 w-auto">
                <span aria-hidden="true" class="absolute inset-0">
                  <img src="https://tailwindui.com/img/ecommerce-images/home-page-01-category-03.jpg" alt=""
                       class="h-full w-full object-cover object-center">
                </span>
                                        <span aria-hidden="true"
                                              class="absolute inset-x-0 bottom-0 h-2/3 bg-gradient-to-t from-gray-800 opacity-50"></span>
                                        <span class="relative mt-auto text-center text-xl font-bold text-white">Sale</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
                <!-- Advertisement section -->
                <section aria-labelledby="social-impact-heading"
                         class="mx-auto max-w-7xl pt-24 px-8">
                    <div class="relative overflow-hidden rounded-lg">
                        <div class="absolute inset-0">
                            <img src="https://tailwindui.com/img/ecommerce-images/home-page-01-feature-section-01.jpg"
                                 alt="" class="h-full w-full object-cover object-center">
                        </div>
                        <div class="relative bg-gray-900 bg-opacity-75 py-8 px-16">
                            <div class="relative mx-auto flex max-w-3xl flex-col items-center text-center">
                                <h2 id="social-impact-heading"
                                    class="text-3xl font-bold tracking-tight text-white sm:text-4xl">
                                    <span class="block">Level up</span>
                                    <span class="block">your desk</span>
                                </h2>
                                <p class="mt-3 text-xl text-white">Make your desk beautiful and organized. Post a
                                    picture to social media and watch it get more likes than life-changing
                                    announcements. Reflect on the shallow nature of existence. At least you have a
                                    really nice desk setup.</p>
                                <a href="#"
                                   class="mt-8 block w-full rounded-md border border-transparent bg-white py-3 px-8 text-base font-medium text-gray-900 hover:bg-gray-100 sm:w-auto">Shop
                                    Workspace</a>
                            </div>
                        </div>
                    </div>
                </section>
                
                <!-- Collection section -->
                <section aria-labelledby="daily-products"
                         class="mx-auto max-w-xl px-4 pt-24 sm:px-6 sm:pt-32 lg:max-w-7xl lg:px-8">
                    <h2 id="daily-products" class="text-2xl font-bold tracking-tight text-gray-900">Daily
                        Products</h2>
                    <p class="mt-4 text-base text-gray-500">Each season, we collaborate with world-class designers to
                        create a collection inspired by the natural world.</p>
                    
                    <div class="mx-auto max-w-7xl overflow-hidden sm:px-6 lg:px-8">
                        <h2 class="sr-only">Products</h2>
                        
                        <div class="-mx-px grid grid-cols-2 border-l border-gray-200 sm:mx-0 md:grid-cols-3 lg:grid-cols-4">
                            <div class="group relative border-r border-b border-gray-200 p-4 sm:p-6">
                                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-lg bg-gray-200 group-hover:opacity-75">
                                    <img src="https://tailwindui.com/img/ecommerce-images/category-page-05-image-card-01.jpg"
                                         alt="TODO" class="h-full w-full object-cover object-center">
                                </div>
                                <div class="pt-10 pb-4 text-center">
                                    <h3 class="text-sm font-medium text-gray-900">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            Organize Basic Set (Walnut)
                                        </a>
                                    </h3>
                                    <div class="mt-3 flex flex-col items-center">
                                        <p class="sr-only">5 out of 5 stars</p>
                                        <div class="flex items-center">
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                        </div>
                                        <p class="mt-1 text-sm text-gray-500">38 reviews</p>
                                    </div>
                                    <p class="mt-4 text-base font-medium text-gray-900">$149</p>
                                </div>
                            </div>
                            
                            <div class="group relative border-r border-b border-gray-200 p-4 sm:p-6">
                                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-lg bg-gray-200 group-hover:opacity-75">
                                    <img src="https://tailwindui.com/img/ecommerce-images/category-page-05-image-card-02.jpg"
                                         alt="TODO" class="h-full w-full object-cover object-center">
                                </div>
                                
                                <div class="pt-10 pb-4 text-center">
                                    <h3 class="text-sm font-medium text-gray-900">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            Organize Pen Holder
                                        </a>
                                    </h3>
                                    <div class="mt-3 flex flex-col items-center">
                                        <p class="sr-only">5 out of 5 stars</p>
                                        <div class="flex items-center">
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                        </div>
                                        <p class="mt-1 text-sm text-gray-500">18 reviews</p>
                                    </div>
                                    <p class="mt-4 text-base font-medium text-gray-900">$15</p>
                                </div>
                            </div>
                            
                            <div class="group relative border-r border-b border-gray-200 p-4 sm:p-6">
                                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-lg bg-gray-200 group-hover:opacity-75">
                                    <img src="https://tailwindui.com/img/ecommerce-images/category-page-05-image-card-03.jpg"
                                         alt="TODO" class="h-full w-full object-cover object-center">
                                </div>
                                <div class="pt-10 pb-4 text-center">
                                    <h3 class="text-sm font-medium text-gray-900">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            Organize Sticky Note Holder
                                        </a>
                                    </h3>
                                    <div class="mt-3 flex flex-col items-center">
                                        <p class="sr-only">5 out of 5 stars</p>
                                        <div class="flex items-center">
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                        </div>
                                        <p class="mt-1 text-sm text-gray-500">14 reviews</p>
                                    </div>
                                    <p class="mt-4 text-base font-medium text-gray-900">$15</p>
                                </div>
                            </div>
                            
                            <div class="group relative border-r border-b border-gray-200 p-4 sm:p-6">
                                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-lg bg-gray-200 group-hover:opacity-75">
                                    <img src="https://tailwindui.com/img/ecommerce-images/category-page-05-image-card-04.jpg"
                                         alt="TODO" class="h-full w-full object-cover object-center">
                                </div>
                                <div class="pt-10 pb-4 text-center">
                                    <h3 class="text-sm font-medium text-gray-900">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            Organize Phone Holder
                                        </a>
                                    </h3>
                                    <div class="mt-3 flex flex-col items-center">
                                        <p class="sr-only">4 out of 5 stars</p>
                                        <div class="flex items-center">
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                            
                                            <!-- Heroicon name: mini/star -->
                                            <svg class="text-gray-200 flex-shrink-0 h-5 w-5"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                                <path fill-rule="evenodd"
                                                      d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                        </div>
                                        <p class="mt-1 text-sm text-gray-500">21 reviews</p>
                                    </div>
                                    <p class="mt-4 text-base font-medium text-gray-900">$15</p>
                                </div>
                            </div>
                            
                            <!-- More products... -->
                        </div>
                    </div>
                </section>
                
                <!-- Advertisement section -->
                <section aria-labelledby="social-impact-heading"
                         class="mx-auto max-w-7xl py-24 px-8">
                    <div class="relative overflow-hidden rounded-lg">
                        <div class="absolute inset-0">
                            <img src="https://tailwindui.com/img/ecommerce-images/home-page-01-feature-section-01.jpg"
                                 alt="" class="h-full w-full object-cover object-center">
                        </div>
                        <div class="relative bg-gray-900 bg-opacity-75 py-8 px-16">
                            <div class="relative mx-auto flex max-w-3xl flex-col items-center text-center">
                                <h2 id="advertising-heading"
                                    class="text-3xl font-bold tracking-tight text-white sm:text-4xl">
                                    <span class="block">Level up</span>
                                    <span class="block">your desk</span>
                                </h2>
                                <p class="mt-3 text-xl text-white">Make your desk beautiful and organized. Post a
                                    picture to social media and watch it get more likes than life-changing
                                    announcements. Reflect on the shallow nature of existence. At least you have a
                                    really nice desk setup.</p>
                                <a href="#"
                                   class="mt-8 block w-full rounded-md border border-transparent bg-white py-3 px-8 text-base font-medium text-gray-900 hover:bg-gray-100 sm:w-auto">Shop
                                    Workspace</a>
                            </div>
                        </div>
                    </div>
                </section>
                
                <!-- Testimonials -->
                <section aria-labelledby="testimonial-heading"
                         class="relative mx-auto max-w-7xl py-24 px-4 sm:px-6 lg:py-32 lg:px-8">
                    <div class="mx-auto max-w-2xl lg:max-w-none">
                        <h2 id="testimonial-heading" class="text-2xl font-bold tracking-tight text-gray-900">What are
                            people saying?</h2>
                        
                        <div class="mt-16 space-y-16 lg:grid lg:grid-cols-3 lg:gap-x-8 lg:space-y-0">
                            <blockquote class="sm:flex lg:block">
                                <svg width="24" height="18" viewBox="0 0 24 18" xmlns="http://www.w3.org/2000/svg"
                                     aria-hidden="true" class="flex-shrink-0 text-gray-300">
                                    <path d="M0 18h8.7v-5.555c-.024-3.906 1.113-6.841 2.892-9.68L6.452 0C3.188 2.644-.026 7.86 0 12.469V18zm12.408 0h8.7v-5.555C21.083 8.539 22.22 5.604 24 2.765L18.859 0c-3.263 2.644-6.476 7.86-6.451 12.469V18z"
                                          fill="currentColor"/>
                                </svg>
                                <div class="mt-8 sm:mt-0 sm:ml-6 lg:mt-10 lg:ml-0">
                                    <p class="text-lg text-gray-600">My order arrived super quickly. The product is even
                                        better than I hoped it would be. Very happy customer over here!</p>
                                    <cite class="mt-4 block font-semibold not-italic text-gray-900">Sarah Peters, New
                                        Orleans</cite>
                                </div>
                            </blockquote>
                            
                            <blockquote class="sm:flex lg:block">
                                <svg width="24" height="18" viewBox="0 0 24 18" xmlns="http://www.w3.org/2000/svg"
                                     aria-hidden="true" class="flex-shrink-0 text-gray-300">
                                    <path d="M0 18h8.7v-5.555c-.024-3.906 1.113-6.841 2.892-9.68L6.452 0C3.188 2.644-.026 7.86 0 12.469V18zm12.408 0h8.7v-5.555C21.083 8.539 22.22 5.604 24 2.765L18.859 0c-3.263 2.644-6.476 7.86-6.451 12.469V18z"
                                          fill="currentColor"/>
                                </svg>
                                <div class="mt-8 sm:mt-0 sm:ml-6 lg:mt-10 lg:ml-0">
                                    <p class="text-lg text-gray-600">I had to return a purchase that didn’t fit. The
                                        whole process was so simple that I ended up ordering two new items!</p>
                                    <cite class="mt-4 block font-semibold not-italic text-gray-900">Kelly McPherson,
                                        Chicago</cite>
                                </div>
                            </blockquote>
                            
                            <blockquote class="sm:flex lg:block">
                                <svg width="24" height="18" viewBox="0 0 24 18" xmlns="http://www.w3.org/2000/svg"
                                     aria-hidden="true" class="flex-shrink-0 text-gray-300">
                                    <path d="M0 18h8.7v-5.555c-.024-3.906 1.113-6.841 2.892-9.68L6.452 0C3.188 2.644-.026 7.86 0 12.469V18zm12.408 0h8.7v-5.555C21.083 8.539 22.22 5.604 24 2.765L18.859 0c-3.263 2.644-6.476 7.86-6.451 12.469V18z"
                                          fill="currentColor"/>
                                </svg>
                                <div class="mt-8 sm:mt-0 sm:ml-6 lg:mt-10 lg:ml-0">
                                    <p class="text-lg text-gray-600">Now that I’m on holiday for the summer, I’ll
                                        probably order a few more shirts. It’s just so convenient, and I know the
                                        quality will always be there.</p>
                                    <cite class="mt-4 block font-semibold not-italic text-gray-900">Chris Paul,
                                        Phoenix</cite>
                                </div>
                            </blockquote>
                        </div>
                    </div>
                </section>
            </main>
            
            <footer aria-labelledby="footer-heading" class="bg-gray-900">
                <h2 id="footer-heading" class="sr-only">Footer</h2>
                <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div class="py-20 xl:grid xl:grid-cols-3 xl:gap-8">
                        <div class="grid grid-cols-2 gap-8 xl:col-span-2">
                            <div class="space-y-12 md:grid md:grid-cols-2 md:gap-8 md:space-y-0">
                                <div>
                                    <h3 class="text-sm font-medium text-white">Shop</h3>
                                    <ul role="list" class="mt-6 space-y-6">
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Bags</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Tees</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Objects</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Home Goods</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Accessories</a>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <h3 class="text-sm font-medium text-white">Company</h3>
                                    <ul role="list" class="mt-6 space-y-6">
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Who we are</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Sustainability</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Press</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Careers</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Terms &amp;
                                                Conditions</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Privacy</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="space-y-12 md:grid md:grid-cols-2 md:gap-8 md:space-y-0">
                                <div>
                                    <h3 class="text-sm font-medium text-white">Account</h3>
                                    <ul role="list" class="mt-6 space-y-6">
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Manage Account</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Returns &amp;
                                                Exchanges</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Redeem a Gift Card</a>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <h3 class="text-sm font-medium text-white">Connect</h3>
                                    <ul role="list" class="mt-6 space-y-6">
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Contact Us</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Twitter</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Instagram</a>
                                        </li>
                                        
                                        <li class="text-sm">
                                            <a href="#" class="text-gray-300 hover:text-white">Pinterest</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="mt-12 md:mt-16 xl:mt-0">
                            <h3 class="text-sm font-medium text-white">Sign up for our newsletter</h3>
                            <p class="mt-6 text-sm text-gray-300">The latest deals and savings, sent to your inbox
                                weekly.</p>
                            <form class="mt-2 flex sm:max-w-md">
                                <label for="email-address" class="sr-only">Email address</label>
                                <input id="email-address" type="text" autocomplete="email" required
                                       class="w-full min-w-0 appearance-none rounded-md border border-white bg-white py-2 px-4 text-base text-gray-900 placeholder-gray-500 shadow-sm focus:border-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-900">
                                <div class="ml-4 flex-shrink-0">
                                    <button type="submit"
                                            class="flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-900">
                                        Sign up
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <div class="border-t border-gray-800 py-10">
                        <p class="text-sm text-gray-400">Copyright &copy; 2021 Your Company, Inc.</p>
                    </div>
                </div>
            </footer>
        </div>
    
    
    </body>
</html>
