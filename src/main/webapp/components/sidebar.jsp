<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="currentPath" value="${requestScope.logicalURI}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- Static sidebar for desktop -->
<div class="flex flex-shrink-0 pt-24">
    <div class="flex w-64 flex-col">
        <div class="flex min-h-0 flex-1 flex-col border-r border-gray-200 bg-gray-100">
            <div class="flex flex-1 flex-col overflow-y-auto pt-5 pb-4">
                <nav class="mt-5 flex-1" aria-label="Sidebar">
                    <div class="space-y-1 px-2">
                        <a href="${contextPath}/user/profile"
                           class="
                           ${currentPath.contains('/user/profile') ? 'bg-gray-200 text-gray-900' : 'text-gray-600'}
                           group flex items-center px-2 py-2 text-sm font-medium rounded-md hover:bg-gray-50 hover:text-gray-900">
                            
                            <svg class="${currentPath.contains('/user/profile') ? 'text-gray-500' : 'text-gray-400 group-hover:text-gray-500'} mr-3 h-6 w-6"
                                 xmlns="http://www.w3.org/2000/svg"
                                 fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                                 aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25"></path>
                            </svg>
                            My Account
                        </a>
                        <a href="${contextPath}/user/history"
                           class="
                           ${currentPath.contains('/user/history') ? 'bg-gray-200 text-gray-900' : 'text-gray-600'}
                           group flex items-center px-2 py-2 text-sm font-medium rounded-md hover:bg-gray-50 hover:text-gray-900">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                 stroke="currentColor"
                                 class="${currentPath.contains('/user/history') ? 'text-gray-500' : 'text-gray-400 group-hover:text-gray-500'} mr-3 h-6 w-6">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 0 0 2.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 0 0-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75 2.25 2.25 0 0 0-.1-.664m-5.8 0A2.251 2.251 0 0 1 13.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25ZM6.75 12h.008v.008H6.75V12Zm0 3h.008v.008H6.75V15Zm0 3h.008v.008H6.75V18Z"></path>
                            </svg>
                            
                            My Purchase
                        </a>
                        <a href="${contextPath}/seller/add"
                           class="
                           ${currentPath.contains('/seller/add') ? 'bg-gray-200 text-gray-900' : 'text-gray-600'}
                           group flex items-center px-2 py-2 text-sm font-medium rounded-md hover:bg-gray-50 hover:text-gray-900">
                            
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                 aria-hidden="true"
                                 stroke="currentColor"
                                 class="${currentPath.contains('/seller/add') ? 'text-gray-500' : 'text-gray-400'} group-hover:text-gray-500 mr-3 h-6 w-6 w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"></path>
                            </svg>
                            Add New Product
                        </a>
                        <a href="${contextPath}/seller/stock"
                           class="
                           ${currentPath.contains('/seller/stock') ? 'bg-gray-200 text-gray-900' : 'text-gray-600'}
                           group flex items-center px-2 py-2 text-sm font-medium rounded-md hover:bg-gray-50 hover:text-gray-900">
                            
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                 stroke="currentColor"
                                 class="${currentPath.contains('/seller/stock') ? 'text-gray-500' : 'text-gray-400'} group-hover:text-gray-500 mr-3 h-6 w-6 w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z"></path>
                            </svg>
                            Manage Products
                        </a>
                        <a href="${contextPath}/seller/revenue"
                           class="
                           ${currentPath.contains('/seller/revenue') ? 'bg-gray-200 text-gray-900' : 'text-gray-600'}
                           group flex items-center px-2 py-2 text-sm font-medium rounded-md hover:bg-gray-50 hover:text-gray-900">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                 stroke="currentColor"
                                 class="${currentPath.contains('/seller/revenue') ? 'text-gray-500' : 'text-gray-400'} group-hover:text-gray-500 mr-3 h-6 w-6 w-6 h-6">
                                >
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M12 6v12m-3-2.818.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"></path>
                            </svg>
                            Manage Revenues
                        </a>
                        <a href="${contextPath}/admin/account"
                           class="
                           ${currentPath.contains('/admin/account') ? 'bg-gray-200 text-gray-900' : 'text-gray-600'}
                           group flex items-center px-2 py-2 text-sm font-medium rounded-md hover:bg-gray-50 hover:text-gray-900">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                 stroke="currentColor"
                                 class="${currentPath.contains('/admin/account') ? 'text-gray-500' : 'text-gray-400'} group-hover:text-gray-500 mr-3 h-6 w-6 w-6 h-6">
                                >
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z"></path>
                            </svg>
                            Manage Accounts
                        </a>
                    </div>
                </nav>
            </div>
        
        </div>
    </div>
</div>
