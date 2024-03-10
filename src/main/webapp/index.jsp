<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Unimart</title>
        <link rel="stylesheet" href="${contextPath}/static/css/tailwind.css"/>
    </head>
    <body>
        <div class="bg-white">
            <jsp:include page="/components/alert.jsp"/>
            <jsp:include page="/components/header.jsp"/>
            
            <main>
                <!-- Category section -->
                <section aria-labelledby="category-heading" class="pt-36 mx-auto max-w-7xl px-8">
                    <div class="flex items-center justify-between px-8">
                        <h2 id="category-heading" class="text-2xl font-bold tracking-tight text-gray-900">Shop by
                            Category</h2>
                        <a href="${contextPath}/categories"
                           class="font-semibold text-indigo-600 hover:text-indigo-500 block">
                            Browse all categories
                            <span aria-hidden="true"> &rarr;</span>
                        </a>
                    </div>
                    
                    <div class="mt-4 flow-root">
                        <div class="relative py-2 overflow-visible">
                            <div id="category-container" class="relative grid grid-cols-8 gap-x-[12rem] px-8">
                            </div>
                        </div>
                    </div>
                
                </section>
                
                <!-- Advertisement section -->
                <section aria-labelledby="community-deals-heading"
                         class="mx-auto max-w-7xl pt-24 px-8">
                    <div class="relative overflow-hidden rounded-lg">
                        <div class="absolute inset-0">
                            <img src="${contextPath}/static/images/advertisements/advertise-1.jpg"
                                 alt="Students exchanging books and gadgets at the university campus"
                                 class="h-full w-full object-cover object-center">
                        </div>
                        <div class="relative bg-gray-900 bg-opacity-75 py-8 px-16">
                            <div class="relative mx-auto flex max-w-3xl flex-col items-center text-center">
                                <h2 id="community-deals-heading"
                                    class="text-3xl font-bold tracking-tight text-white">
                                    <span class="block">Connect, Exchange,</span>
                                    <span class="block">Empower Your Studies</span>
                                </h2>
                                <p class="mt-3 text-xl text-white leading-8">Find everything you need for your
                                    university life,
                                    from textbooks to tech. Share resources with peers, save money, and make the most of
                                    your campus experience. Sustainable, smart, and student-focused. Unimart is your
                                    marketplace.</p>
                                <a href="#"
                                   class="mt-8 block rounded-md border border-transparent bg-white py-3 px-8 font-medium text-gray-900 hover:bg-gray-100 w-auto">Start
                                    Buying Now</a>
                            </div>
                        </div>
                    </div>
                </section>
                
                <!-- Product section -->
                <section aria-labelledby="daily-products"
                         class="mx-auto max-w-xl px-4 pt-24 sm:px-6 sm:pt-32 lg:max-w-7xl lg:px-8">
                    <h2 id="daily-products" class="text-2xl font-bold tracking-tight text-gray-900">Daily
                        Products</h2>
                    <p class="mt-4 text-base text-gray-500">Each season, we collaborate with world-class designers to
                        create a collection inspired by the natural world.</p>
                    <jsp:include page="/components/product.jsp"/>
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
                                          fill="currentColor"></path>
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
                                          fill="currentColor"></path>
                                </svg>
                                <div class="mt-8 sm:mt-0 sm:ml-6 lg:mt-10 lg:ml-0">
                                    <p class="text-lg text-gray-600">I had to return a purchase that did’t fit. The
                                        whole process was so simple that I ended up ordering two new items!</p>
                                    <cite class="mt-4 block font-semibold not-italic text-gray-900">Kelly,
                                        Chicago</cite>
                                </div>
                            </blockquote>
                            
                            <blockquote class="sm:flex lg:block">
                                <svg width="24" height="18" viewBox="0 0 24 18" xmlns="http://www.w3.org/2000/svg"
                                     aria-hidden="true" class="flex-shrink-0 text-gray-300">
                                    <path d="M0 18h8.7v-5.555c-.024-3.906 1.113-6.841 2.892-9.68L6.452 0C3.188 2.644-.026 7.86 0 12.469V18zm12.408 0h8.7v-5.555C21.083 8.539 22.22 5.604 24 2.765L18.859 0c-3.263 2.644-6.476 7.86-6.451 12.469V18z"
                                          fill="currentColor"></path>
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
            
            <%@ include file="/components/footer.jsp" %>
        </div>
        
        <script type="text/javascript">
            const contextPath = "${pageContext.request.contextPath}";
        </script>
        <script src="${pageContext.request.contextPath}/static/js/index.js"></script>
    </body>
</html>
