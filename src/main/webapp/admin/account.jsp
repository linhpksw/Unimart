<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="users" value="${requestScope.users}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="flex items-center py-6 px-4">
    <div class="flex-auto">
        <h1 class="text-xl font-bold leading-7 text-gray-900">Manage Users</h1>
        <p class="mt-2 text-sm text-gray-700">A list of all the users in your account including their name, title,
            email and role.</p>
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
                                class="px-3 py-3.5 text-center font-semibold text-gray-900">Username
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-center font-semibold text-gray-900">
                                Name
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-center font-semibold text-gray-900">
                                Email
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-center font-semibold text-gray-900">Role
                            </th>
                            <th scope="col" class="px-3 py-3.5 text-center font-semibold text-gray-900">Joined At
                            </th>
                            <th scope="col" class="relative py-3.5 pl-3 pr-4">
                                <span class="sr-only">Delete</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200 bg-white">
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td class="whitespace-nowrap py-4 pl-4 pr-3">
                                    <div class="font-semibold text-gray-900 text-center">${user.id}</div>
                                </td>
                                <td class="whitespace-nowrap px-3 py-4 text-gray-500">
                                    <div class="text-gray-900 text-center">${user.name}</div>
                                </td>
                                
                                <td class="whitespace-nowrap text-center px-3 py-4 text-gray-500">
                                    <div class="text-gray-900 text-center">${user.email}</div>
                                </td>
                                
                                <td class="whitespace-nowrap text-center px-3 py-4 text-gray-500">
                                    <c:choose>
                                        <c:when test="${user.role eq 'seller'}">
                                            <span class="text-fuchsia-800 bg-fuchsia-100 inline-flex rounded-lg px-4 py-3 font-semibold leading-5">Seller</span>
                                        </c:when>
                                        <c:when test="${user.role eq 'customer'}">
                                            <span class="text-green-800 bg-green-100 inline-flex rounded-lg px-4 py-3 font-semibold leading-5">Customer</span>
                                        </c:when>
                                        <c:when test="${user.role eq 'admin'}">
                                            <span class="text-amber-800 bg-amber-100 inline-flex rounded-lg px-4 py-3 font-semibold leading-5">Admin</span>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- Handle any other unexpected role here, defaulting to a neutral appearance -->
                                            <span class="text-gray-800 bg-gray-100 inline-flex rounded-lg px-4 py-3 font-semibold leading-5">Unknown Role</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                
                                <td class="price text-right whitespace-nowrap px-3 py-4 text-gray-500">
                                    <div class="time text-gray-900 text-right">${user.createdAt}</div>
                                </td>
                                
                                <td class="relative whitespace-nowrap py-4 pl-3 pr-6 text-right font-medium">
                                    <a href="${contextPath}/admin/delete/${user.id}"
                                       class="text-red-600 hover:text-red-900">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
