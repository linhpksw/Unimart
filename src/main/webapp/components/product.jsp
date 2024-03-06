<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="products" value="${requestScope.products}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="imageSrc" value="${contextPath}/static/images/products"/>


<div class="mx-auto overflow-hidden px-8">
    <h2 class="sr-only">Products</h2>
    <div class="grid-cols-4 grid gap-4 border-gray-200">
        <c:forEach var="product" items="${products}">
            <div class="col-span-1 group relative border border-gray-200 p-4">
                <div class="aspect-w-1 aspect-h-1 overflow-hidden rounded-lg bg-gray-200 group-hover:opacity-75">
                    <img src="${imageSrc}/${product.images[0]}" alt="Product Image"
                         class="h-full w-full object-cover object-center">
                </div>
                <div class="pt-10 pb-4 text-center">
                    <h3 class="text-sm font-medium text-gray-900">
                        <a href="${contextPath}/product/${product.id}">
                            <span aria-hidden="true" class="absolute inset-0"></span>${product.name}
                        </a>
                    </h3>
                    <div class="mt-3 flex flex-col items-center">
                        <p class="sr-only">5 out of 5 stars</p>
                        <div class="flex items-center">
                            <c:forEach var="i" begin="1" end="5" step="1">
                                <!-- Heroicon name: mini/star -->
                                <svg class="text-yellow-400 flex-shrink-0 h-5 w-5"
                                     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                     fill="currentColor" aria-hidden="true">
                                    <path fill-rule="evenodd"
                                          d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </c:forEach>
                        </div>
                        <p class="mt-1 text-sm text-gray-500">38 sold</p>
                    </div>
                    <p class="mt-4 text-base font-medium text-gray-900">${product.averagePrice}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
