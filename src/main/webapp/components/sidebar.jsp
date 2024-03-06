<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:set var="currentPath" value="${requestScope.logicalURI}"/>

<!-- Static sidebar for desktop -->
<div class="flex flex-shrink-0 pt-24">
    <div class="flex w-64 flex-col">
        <div class="flex min-h-0 flex-1 flex-col border-r border-gray-200 bg-gray-100">
            <div class="flex flex-1 flex-col overflow-y-auto pt-5 pb-4">
                <nav class="mt  -5 flex-1" aria-label="Sidebar">
                    <div class="space-y-1 px-2">
                        <!-- Current: "bg-gray-200 text-gray-900", Default: "text-gray-600 hover:bg-gray-50 hover:text-gray-900" -->
                        <a href="${pageContext.request.contextPath}/user/profile"
                           class="
                           ${currentPath.contains('/user/profile') ? 'bg-gray-200 text-gray-900' : 'text-gray-600'}
                           group flex items-center px-2 py-2 text-sm font-medium rounded-md hover:bg-gray-50 hover:text-gray-900">
                            <!--
                              Heroicon name: outline/home
            
                              Current: "text-gray-500", Default: "text-gray-400 group-hover:text-gray-500"
                            -->
                            <svg class="text-gray-500 mr-3 h-6 w-6"
                                 xmlns="http://www.w3.org/2000/svg"
                                 fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                                 aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25"></path>
                            </svg>
                            My account
                        </a>
                        
                        <a href="${pageContext.request.contextPath}/user/add"
                           class="
                           ${currentPath.contains('/user/add') ? 'bg-gray-200 text-gray-900' : 'text-gray-600'}
                           group flex items-center px-2 py-2 text-sm font-medium rounded-md hover:bg-gray-50 hover:text-gray-900">
                            <!--
                              Heroicon name: outline/home
            
                              Current: "text-gray-500", Default: "text-gray-400 group-hover:text-gray-500"
                            -->
                            
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                 aria-hidden="true"
                                 stroke="currentColor" class="text-gray-500 mr-3 h-6 w-6 w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"></path>
                            </svg>
                            Add new product
                        </a>
                    </div>
                </nav>
            </div>
        
        </div>
    </div>
</div>
