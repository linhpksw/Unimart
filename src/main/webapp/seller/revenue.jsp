<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:set var="orders" value="${requestScope.orders}"/>
<c:set var="totalRevenue" value="${requestScope.totalRevenue}"/>
<c:set var="totalOrders" value="${requestScope.totalOrders}"/>
<c:set var="totalItemsSold" value="${requestScope.totalItemsSold}"/>

<main class="py-6 px-4">
    <div class="mx-auto space-y-4 max-w-full px-0">
        <h1 class="text-2xl font-bold leading-7 text-gray-900">Manage Revenues</h1>
        
        <dl class="grid gap-5 grid-cols-3">
            <div class="relative overflow-hidden rounded-lg px-4 pt-5 mb-5 shadow-lg">
                <dt>
                    <div class="absolute rounded-md bg-indigo-500 p-3">
                        <!-- Heroicon name: outline/users -->
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="currentColor" class="w-6 h-6 text-white">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M12 6v12m-3-2.818.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"></path>
                        </svg>
                    </div>
                    <p class="ml-16 truncate text-sm font-medium text-gray-500">Total Revenues</p>
                </dt>
                <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
                    <p class="price text-2xl font-semibold text-gray-900">${totalRevenue}</p>
                </dd>
            </div>
            
            <div class="relative overflow-hidden rounded-lg px-4 pt-5 mb-5 shadow-lg">
                <dt>
                    <div class="absolute rounded-md bg-indigo-500 p-3">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="currentColor" class="w-6 h-6 text-white">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z"></path>
                        </svg>
                    
                    </div>
                    <p class="ml-16 truncate text-sm font-medium text-gray-500">Total Orders</p>
                </dt>
                <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
                    <p class="text-2xl font-semibold text-gray-900">${totalOrders}</p>
                </dd>
            </div>
            
            <div class="relative overflow-hidden rounded-lg px-4 pt-5 mb-5 shadow-lg">
                <dt>
                    <div class="absolute rounded-md bg-indigo-500 p-3">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="currentColor" class="w-6 h-6 text-white">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z"></path>
                        </svg>
                    
                    </div>
                    <p class="ml-16 truncate text-sm font-medium text-gray-500">Total Items Sold</p>
                </dt>
                <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
                    <p class="text-2xl font-semibold text-gray-900">${totalItemsSold}</p>
                </dd>
            </div>
        </dl>
    </div>
    
    <div id="orders-container" class="mx-auto space-y-8 max-w-full px-0">
        <c:set var="counter" value="0" scope="page"/> <!-- Initialize counter -->
        <c:forEach var="order" items="${orders}">
            <c:forEach var="item" items="${order.items}">
                <c:set var="counter" value="${counter + 1}"/> <!-- Increment counter -->
                <div class="border-gray-200 border shadow-sm rounded-lg">
                    <div class="border-b border-gray-200 p-4 grid grid-cols-12 gap-x-4">
                        <dl class="col-span-11 grid grid-cols-12 flex-1 gap-x-6 ">
                            <div class="col-span-1">
                                <dt class="font-medium text-gray-900">No</dt>
                                <dd class="mt-1 text-gray-500">${counter}</dd>
                            </div>
                            <div class="col-span-2">
                                <dt class="font-medium text-gray-900">Order number</dt>
                                <dd class="mt-1 text-gray-500">#${order.orderId}</dd>
                            </div>
                            <div class="col-span-4">
                                <dt class="font-medium text-gray-900">Date placed</dt>
                                <dd class="time mt-1 text-gray-500">${order.orderDate}</dd>
                            </div>
                            <div class="col-span-2">
                                <dt class="font-medium text-gray-900">Total amount</dt>
                                <dd class="price mt-1 text-gray-500">${order.total}</dd>
                            </div>
                            <div class="col-span-2">
                                <dt class="font-medium text-gray-900">Customer</dt>
                                <dd class="mt-1 text-gray-500">${order.userId}</dd>
                            </div>
                        </dl>
                        
                        <div class="col-span-1 flex items-center justify-end">
                            <a href="${contextPath}/order/${order.orderId}">
                                <button type="button"
                                        class="inline-flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 w-auto">
                                    View
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:forEach>
    </div>
</main>
