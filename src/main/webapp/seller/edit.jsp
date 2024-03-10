<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%-- Edit --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="imageSrc" value="${contextPath}/static/images/products"/>
<c:set var="productDetail" value="${requestScope.productDetail}"/>
<c:set var="product" value="${productDetail.product}"/>
<c:set var="productItems" value="${productDetail.productItems}"/>

<c:set var="images" value="${product.images}"/>

<c:set var="productDetailJson" value="${requestScope.productDetailJson}"/>

<c:set var="length" value="${fn:length(productItems)}"/>

<form action="${pageContext.request.contextPath}/seller/edit/${product.id}" method="post" enctype="multipart/form-data">
    <div class="space-y-6 py-6 px-4">
        <%-- General information --%>
        <div class="border-b border-gray-900/10 pb-12">
            <h2 class="text-xl font-bold leading-7 text-gray-900">Edit Product</h2>
            <p class="mt-1 leading-6 text-gray-600">Describe about your product.</p>
            
            <div class="mt-10 grid grid-cols-12 gap-6">
                <%-- Images area --%>
                <c:forEach var="i" begin="1" end="4" step="1">
                    <div class="col-span-2">
                        <span class="block text-lg text-center font-bold leading-6 text-gray-900">Image ${i}</span>
                        
                        <div id="upload-container-${i}"
                             class="mt-4 p-3 mb-4 bg-gray-100 border-dashed border-2 border-gray-400 rounded-lg items-center mx-auto text-center cursor-pointer">
                            <input name="file${i}" id="file${i}" type="file" class="hidden" accept="image/*"/>
                            <label for="file${i}" class="cursor-pointer">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                     stroke-width="1.5"
                                     stroke="currentColor" class="w-8 h-8 text-gray-700 mx-auto mb-4">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M3 16.5v2.25A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75V16.5m-13.5-9L12 3m0 0l4.5 4.5M12 3v13.5"></path>
                                </svg>
                                <h5 class="mb-2 font-bold tracking-tight text-gray-700">Upload</h5>
                            </label>
                        </div>
                        
                        <div id="preview-container-${i}"></div>
                    </div>
                </c:forEach>
                
                <%-- Product name area --%>
                <div class="col-span-8">
                    <label for="product-name" class="block text-sm font-medium leading-6 text-gray-900">Product
                        name</label>
                    <div class="mt-2">
                        <input type="text" name="product-name" id="product-name"
                               autocomplete="product-name"
                               value="${product.name}"
                               class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                    </div>
                </div>
                
                <%-- Category area --%>
                <div class="col-span-4">
                    <label for="category" class="block text-sm font-medium leading-6 text-gray-900">Category</label>
                    <div class="mt-2">
                        <select id="category" name="category" autocomplete="category"
                                class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6">
                            <option ${product.category == 'Men Clothes' ? 'selected' : ''}>Men Clothes</option>
                            <option ${product.category == 'Women Clothes' ? 'selected' : ''}>Women Clothes</option>
                            <option ${product.category == 'Mobile & Gadgets' ? 'selected' : ''}>Mobile & Gadgets
                            </option>
                            <option ${product.category == 'Moms, Kids & Babies' ? 'selected' : ''}>Moms, Kids & Babies
                            </option>
                            <option ${product.category == 'Consumer Electronics' ? 'selected' : ''}>Consumer
                                Electronics
                            </option>
                            <option ${product.category == 'Home & Living' ? 'selected' : ''}>Home & Living</option>
                            <option ${product.category == 'Computer & Accessories' ? 'selected' : ''}>Computer &
                                Accessories
                            </option>
                            <option ${product.category == 'Beauty' ? 'selected' : ''}>Beauty</option>
                            <option ${product.category == 'Cameras' ? 'selected' : ''}>Cameras</option>
                            <option ${product.category == 'Health' ? 'selected' : ''}>Health</option>
                            <option ${product.category == 'Watches' ? 'selected' : ''}>Watches</option>
                            <option ${product.category == 'Women Shoes' ? 'selected' : ''}>Women Shoes</option>
                            <option ${product.category == 'Men Shoes' ? 'selected' : ''}>Men Shoes</option>
                            <option ${product.category == 'Women Bags' ? 'selected' : ''}>Women Bags</option>
                            <option ${product.category == 'Home Appliances' ? 'selected' : ''}>Home Appliances</option>
                            <option ${product.category == 'Fashion Accessories' ? 'selected' : ''}>Fashion Accessories
                            </option>
                            <option ${product.category == 'Sport & Outdoor' ? 'selected' : ''}>Sport & Outdoor</option>
                            <option ${product.category == 'Grocery' ? 'selected' : ''}>Grocery</option>
                            <option ${product.category == 'Automotive' ? 'selected' : ''}>Automotive</option>
                            <option ${product.category == 'Books & Stationery' ? 'selected' : ''}>Books & Stationery
                            </option>
                            <option ${product.category == 'Men Bags' ? 'selected' : ''}>Men Bags</option>
                            <option ${product.category == 'Kid Fashion' ? 'selected' : ''}>Kid Fashion</option>
                            <option ${product.category == 'Toys' ? 'selected' : ''}>Toys</option>
                            <option ${product.category == 'Home care' ? 'selected' : ''}>Home care</option>
                            <option ${product.category == 'Pets' ? 'selected' : ''}>Pets</option>
                            <option ${product.category == 'Tickets, Vouchers & Services' ? 'selected' : ''}>Tickets,
                                Vouchers & Services
                            </option>
                            <option ${product.category == 'Tools & Home Improvement' ? 'selected' : ''}>Tools & Home
                                Improvement
                            </option>
                        </select>
                    </div>
                </div>
                
                <%-- About area --%>
                <div class="col-span-8">
                    <label for="about" class="block text-sm font-medium leading-6 text-gray-900">Product
                        description</label>
                    <div class="mt-2">
                        <textarea id="about" name="about" rows="4"
                                  class="overflow-hidden block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600">${product.description}</textarea>
                    </div>
                    <p class="mt-3 leading-6 text-gray-600">Write a few sentences about your product. Please
                        type at least 100 characters.</p>
                </div>
            </div>
        </div>
        
        <%-- Sale information --%>
        <div class="border-b border-gray-900/10 pb-12">
            <h2 class=" font-semibold leading-7 text-gray-900">Sale information</h2>
            <p class="mt-1 text-sm leading-6 text-gray-600">Please type precisely for increasing popular.</p>
            
            <div class="mt-10 grid grid-cols-12 gap-x-6 gap-y-8">
                <%-- Product only --%>
                <div id="product-only-container"
                     class="${length > 1 ? 'hidden' : 'block'}
                     grid grid-cols-12 col-span-full gap-4">
                    <%--  Product price only --%>
                    <div class="col-span-4">
                        <label for="price-only"
                               class="block font-medium leading-6 text-gray-900">Product price</label>
                        <div class="mt-2">
                            <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600">
                                <span class="flex select-none items-center pl-3 text-gray-500">₫</span>
                                <input type="text" name="${length > 1 ? '' : 'price-only'}" id="price-only"
                                       value="${productItems[0].price}"
                                       class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0"
                                       placeholder="">
                            </div>
                        </div>
                    </div>
                    <%-- Product quantity only --%>
                    <div class="col-span-4">
                        <label for="quantity-only"
                               class="block font-medium leading-6 text-gray-900">Quantity</label>
                        <div class="mt-2">
                            <input type="text" name="${length > 1 ? '' : 'quantity-only'}" id="quantity-only"
                                   value="${productItems[0].stock}"
                                   class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600">
                        </div>
                    </div>
                </div>
                
                <%-- Product many --%>
                <div id="product-many-container"
                     class="${length > 1 ? 'block' : 'hidden'} col-span-full grid grid-cols-12 gap-x-6 gap-y-8">
                    
                    <%-- Table variation area --%>
                    <div id="table-container"
                         class="${length > 1 ? 'block' : 'hidden'} col-start-1 grid grid-flow-col auto-cols-max">
                        <div class="col-span-full">
                            <label for="product-class-list"
                                   class="block font-medium leading-6 text-gray-900">Product classification
                                list</label>
                        </div>
                        
                        <div id="product-class-list" class="col-start-1 mt-2 ring-1 ring-gray-300 rounded-lg">
                            <table class="min-w-full divide-y divide-gray-300">
                                <thead>
                                    <tr>
                                        <th scope="col"
                                            class="px-3 py-3.5 text-center font-semibold text-gray-900">
                                            <c:forEach var="attribute" items="${productItems[0].attributes.entrySet()}">
                                                <c:out value="${attribute.key}"/>
                                            </c:forEach>
                                        </th>
                                        <th scope="col"
                                            class="px-3 py-3.5 text-center font-semibold text-gray-900">
                                            Price
                                        </th>
                                        <th scope="col"
                                            class="px-3 py-3.5 text-center font-semibold text-gray-900">
                                            Quantity
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tbody>
                                    <c:forEach var="productItem" items="${productItems}" varStatus="status">
                                        <tr>
                                            <td class="px-3 py-2 text-center text-gray-500"><c:forEach var="attribute"
                                                                                                       items="${productItem.attributes.entrySet()}">
                                                <c:out value="${attribute.value}"/>
                                            </c:forEach></td>
                                            
                                            <td class="px-3 py-2 text-gray-500">
                                                <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600">
                                                    <span class="flex select-none items-center pl-3 text-gray-500">₫</span>
                                                    <input type="text" name="product-price-${status.index}"
                                                           id="product-price-${status.index}"
                                                           value="${productItem.price}"
                                                           class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0"
                                                           placeholder="">
                                                </div>
                                            </td>
                                            <td class="px-3 py-2 text-gray-500">
                                                <input type="number" name="product-quantity-${status.index}"
                                                       id="product-quantity-${status.index}"
                                                       value="${productItem.stock}"
                                                       class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600">
                                            </td>
                                        </tr>
                                        <input type="hidden" value="${productItem.id}"
                                               name="product-item-id-${status.index}">
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%-- Verify button --%>
        <div class="flex items-center justify-end gap-x-6">
            <button type="button" class="font-semibold leading-6 text-gray-900">Cancel</button>
            <button type="submit"
                    class="rounded-md bg-indigo-600 px-3 py-2 font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                Save
            </button>
        </div>
    </div>
</form>

<script>
    const productDetailJson = JSON.parse('${productDetailJson}');
    const imageSrc = '${imageSrc}';
    const contextPath = '${contextPath}';
</script>
