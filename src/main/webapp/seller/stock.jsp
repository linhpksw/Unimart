<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="imageSrc" value="${contextPath}/static/images/products"/>
<c:set var="productsStock" value="${requestScope.productsStock}"/>

<div class="flex items-center py-6 px-4">
    <div class="flex-auto">
        <h1 class="text-xl font-bold leading-7 text-gray-900">Manage products</h1>
        <p class="mt-2 text-sm text-gray-700">A list of all the users in your account including their name, title,
            email and role.</p>
    </div>
    <div class="ml-16">
        <a href="${contextPath}/seller/add">
            <button type="button"
                    class="inline-flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 w-auto">
                Add new product
            </button>
        </a>
    </div>
</div>

<div class="px-4 pb-6 flex flex-col">
    <div class="overflow-x-auto">
        <div class="inline-block min-w-full py-2 align-middle">
            <div class="overflow-hidden border shadow ring-1 ring-black ring-opacity-5 rounded-lg">
                <table class="min-w-full divide-y divide-gray-300">
                    <thead class="bg-gray-100">
                        <tr>
                            <th scope="col"
                                class="py-3.5 pl-4 pr-3 text-center font-semibold text-gray-900">No.
                            </th>
                            <th scope="col"
                                class="py-3.5 pl-4 pr-3 text-left font-semibold text-gray-900">Product name
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-center font-semibold text-gray-900">
                                Stock
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-center font-semibold text-gray-900">
                                Status
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-right font-semibold text-gray-900">Price
                            </th>
                            <th scope="col" class="relative py-3.5 pl-3 pr-4">
                                <span class="sr-only">Edit</span>
                            </th>
                            <th scope="col" class="relative py-3.5 pl-3 pr-4">
                                <span class="sr-only">Delete</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200 bg-white">
                        <c:set var="counter" value="0" scope="page"/> <!-- Initialize counter -->
                        <c:forEach var="productDetail" items="${productsStock}">
                            
                            <c:set var="product" value="${productDetail.product}"/>
                            <c:set var="productItems" value="${productDetail.productItems}"/>
                            
                            <c:forEach var="productItem" items="${productItems}">
                                <c:set var="counter" value="${counter + 1}"/> <!-- Increment counter -->
                                <tr>
                                    <td class="whitespace-nowrap px-3 py-4 text-gray-500">
                                        <div class="text-gray-900 text-center">${counter}</div>
                                    </td>
                                    <td class="whitespace-nowrap py-4 pl-4 pr-3">
                                        <div class="flex items-center">
                                            <div class="h-10 w-10 flex-shrink-0 overflow-hidden rounded-lg">
                                                <img class="h-full w-full object-cover object-center"
                                                     src="${imageSrc}/${product.images[0]}"
                                                     alt="${product.name}">
                                            </div>
                                            <div class="ml-4">
                                                <div>
                                                    <a class="font-medium text-gray-900"
                                                       href="${contextPath}/product/${product.id}">${product.name}
                                                    </a>
                                                </div>
                                                <c:forEach var="attribute" items="${productItem.attributes.entrySet()}">
                                                    <div class="text-gray-500 text-sm"><c:out value="${attribute.key}"/>
                                                        | <c:out value="${attribute.value}"/></div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="whitespace-nowrap px-3 py-4 text-gray-500">
                                        <div class="text-gray-900 text-center">${productItem.stock}</div>
                                    </td>
                                    
                                    <td class="whitespace-nowrap text-center px-3 py-4 text-gray-500">
                                        <span
                                                class="
                                                ${productItem.stock > 0 ? 'text-green-800 bg-green-100' : 'text-red-800 bg-red-100'}
                                                inline-flex rounded-lg px-4 py-3 font-semibold leading-5">${productItem.stock > 0 ? 'In Stock' : 'Out of Stock'}</span>
                                    </td>
                                    
                                    <td class="price text-right whitespace-nowrap px-3 py-4 text-gray-500">${productItem.price}</td>
                                    
                                    <td class="relative whitespace-nowrap py-4 pl-3 pr-6 text-right font-medium">
                                        <a href="${contextPath}/seller/edit/${product.id}"
                                           class="text-indigo-600 hover:text-indigo-900">Edit</a>
                                    </td>
                                    <td class="relative whitespace-nowrap py-4 pl-3 pr-6 text-right font-medium">
                                        <a href="${contextPath}/seller/delete/${productItem.id}"
                                           class="text-red-600 hover:text-red-900">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
                        <!-- More product... -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
