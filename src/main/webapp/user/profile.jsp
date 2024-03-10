<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="user" value="${sessionScope.user}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<form class="divide-y divide-gray-200 lg:col-span-9" action="${contextPath}/user/profile"
      method="POST">
    <!-- Profile section -->
    <div class="py-6 px-4 sm:p-6 lg:pb-8">
        <div>
            <h2 class="text-lg font-medium leading-6 text-gray-900">Profile</h2>
            <p class="mt-1 text-sm text-gray-500">This information will be displayed
                publicly so be careful what you share.</p>
        </div>
        
        <div class="mt-6 flex flex-col lg:flex-row">
            <div class="flex-grow space-y-6">
                <!-- Username -->
                <div>
                    <label for="username"
                           class="block font-medium text-gray-700">Username</label>
                    <div class="mt-1 flex rounded-md shadow-sm">
                        <span class="inline-flex items-center rounded-l-md border border-r-0 border-gray-300 bg-gray-50 px-3 text-gray-500 sm:text-sm">unimart.tech/</span>
                        <input type="text" name="username" id="username"
                               autocomplete="username"
                               readonly
                               value="${user.id}"
                               class="block w-full min-w-0 flex-grow rounded-none rounded-r-md border-gray-300 focus:border-sky-500 focus:ring-sky-500 sm:text-sm"
                        >
                    </div>
                </div>
                
                <!-- About -->
                <div>
                    <label for="about"
                           class="block font-medium text-gray-700">About</label>
                    <div class="mt-1">
                        <textarea id="about" name="about" rows="3" required
                                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-sky-500 focus:ring-sky-500">${user.about}</textarea>
                    </div>
                    <p class="mt-2 text-sm text-gray-500">Brief description for your
                        profile. URLs are hyperlinked.</p>
                </div>
            </div>
            
            <!-- Profile photo -->
            <div class="mt-0 ml-6 flex-shrink-0 flex-grow-0">
                <p class="font-medium text-gray-700" aria-hidden="true">
                    Photo</p>
                
                <div class="relative overflow-hidden rounded-full block">
                    <img class="relative h-40 w-40 rounded-full"
                         src="https://images.unsplash.com/photo-1517365830460-955ce3ccd263?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=320&h=320&q=80"
                         alt="">
                    <label for="desktop-user-photo"
                           class="absolute inset-0 flex h-full w-full items-center justify-center bg-black bg-opacity-75 text-sm font-medium text-white opacity-0 focus-within:opacity-100 hover:opacity-100">
                        <span>Change</span>
                        <span class="sr-only"> user photo</span>
                        <input type="file" id="desktop-user-photo" name="user-photo"
                               class="absolute inset-0 h-full w-full cursor-pointer rounded-md border-gray-300 opacity-0">
                    </label>
                </div>
            </div>
        </div>
        
        <div class="mt-6 grid grid-cols-12 gap-6">
            <!-- Full Name -->
            <div class="col-span-6">
                <label for="name"
                       class="block font-medium text-gray-700">Full name</label>
                <input type="text" name="name" id="name"
                       autocomplete="name"
                       required
                       value="${user.name}"
                       class="mt-1 block w-full rounded-md border border-gray-300 py-2 px-3 shadow-sm focus:border-sky-500 focus:outline-none focus:ring-sky-500">
            </div>
            
            <!-- Email -->
            <div class="col-span-6">
                <label for="email"
                       class="block font-medium text-gray-700">Email</label>
                <input type="text" name="email" id="email"
                       autocomplete="email"
                       required
                       value="${user.email}"
                       class="mt-1 block w-full rounded-md border border-gray-300 py-2 px-3 shadow-sm focus:border-sky-500 focus:outline-none focus:ring-sky-500">
            </div>
            
            <!-- Phone number -->
            <div class="col-span-6">
                <label for="phone"
                       class="block font-medium text-gray-700">Phone
                    number</label>
                <input type="text" name="phone" id="phone"
                       required
                       autocomplete="phone" value="${user.phone}"
                       pattern="\d{10}"
                       title="Phone number should be 10 digits"
                       class="mt-1 block w-full rounded-md border border-gray-300 py-2 px-3 shadow-sm focus:border-sky-500 focus:outline-none focus:ring-sky-500">
            </div>
            
            <!-- Gender -->
            <div class="col-span-6">
                <div>
                    <label class="block font-medium text-gray-700">Gender</label>
                    
                    <div class="mt-2 flex items-center space-y-0 space-x-10">
                        <div class="flex items-center">
                            <input id="male" name="gender" value="male" required
                            ${user.gender == 'male' ? 'checked' : ''}
                                   type="radio"
                                   class="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-500">
                            <label for="male"
                                   class="ml-3 block medium text-gray-700">Male</label>
                        </div>
                        
                        <div class="flex items-center">
                            <input id="female" name="gender" value="female" type="radio"
                            ${user.gender == 'female' ? 'checked' : ''}
                                   class="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-500">
                            <label for="female"
                                   class="ml-3 block font-medium text-gray-700">Female</label>
                        </div>
                        
                        <div class="flex items-center">
                            <input id="other" name="gender" value="other" type="radio"
                            ${user.gender == 'other' ? 'checked' : ''}
                                   class="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-500">
                            <label for="other"
                                   class="ml-3 block font-medium text-gray-700">Other</label>
                        </div>
                    </div>
                
                </div>
            </div>
            
            <!-- Date of birth -->
            <div class="col-span-6">
                <label for="dob"
                       class="block font-medium text-gray-700">Date of
                    birth</label>
                <input type="date" name="dob" id="dob"
                       required
                       value="${user.dob}"
                       autocomplete="dob"
                       class="mt-1 block w-full rounded-md border border-gray-300 py-2 px-3 shadow-sm focus:border-sky-500 focus:outline-none focus:ring-sky-500">
            </div>
        </div>
    </div>
    
    <!-- Address section -->
    <div class="divide-y divide-gray-200 py-6">
        <div class="px-4 sm:px-6">
            <div>
                <h2 class="text-lg font-medium leading-6 text-gray-900">My
                    Addresses</h2>
                <p class="mt-1 text-gray-500">Here is the address that shipper
                    will deliver to you.</p>
            </div>
            
            <div class="mt-6 grid grid-cols-12 gap-6">
                <!-- Address -->
                <div class="col-span-6">
                    <label for="address"
                           class="block font-medium text-gray-700">Address</label>
                    <input type="text" name="address" id="address"
                           value="${user.address}"
                           autocomplete="address"
                           required
                           class="mt-1 block w-full rounded-md border border-gray-300 py-2 px-3 shadow-sm focus:border-sky-500 focus:outline-none focus:ring-sky-500">
                </div>
            </div>
        
        </div>
    </div>
    
    <!-- Register shop section -->
    <div class="divide-y divide-gray-200 pt-6">
        <div class="px-4 sm:px-6">
            <div>
                <h2 class="text-lg font-medium leading-6 text-gray-900">Activate Your
                    Shop Account</h2>
                <p class="mt-1 text-gray-500">Turn on your shop account to start
                    engaging with customers and manage your products on our
                    platform.</p>
            </div>
            
            <div class="flex items-center justify-between py-4">
                <div class="flex flex-col">
                    <p class="font-medium text-gray-900"
                    >Activate</p>
                    <p class="text-gray-500">
                        By enabling your shop account, you agree with our
                        platform's
                        <a href="#" class="text-blue-600 hover:text-blue-800">Terms of
                            Service</a> and
                        <a href="#" class="text-blue-600 hover:text-blue-800">Privacy
                            Policy</a>.</p>
                </div>
                <!-- Enabled: "bg-teal-500", Not Enabled: "bg-gray-200" -->
                <button
                        id="shopActivateBtn"
                        aria-checked="false"
                        type="button"
                        onclick="toggleShopActivate()"
                        class="${user.role == 'seller' ? 'bg-violet-500' : 'bg-gray-200'}   relative ml-4 inline-flex h-6 w-11 flex-shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2"
                >
                    <!-- Enabled: "translate-x-5", Not Enabled: "translate-x-0" -->
                    <span id="shopActivateKnob"
                          aria-hidden="true"
                          class="${user.role == 'seller' ? 'translate-x-5' : 'translate-x-0'}  inline-block h-5 w-5 transform rounded-full bg-white shadow ring-0 transition duration-200 ease-in-out"></span>
                </button>
                
                <!-- Hidden input to store the state of the toggle -->
                <input type="hidden" id="shopActivated" name="shopActivated"
                       value="${user.role == 'seller' ? 'true' : 'false'}"/>
            </div>
        
        </div>
        
        <div class="mt-4 flex justify-end py-4 px-4 sm:px-6">
            <button type="submit"
                    class="ml-5 inline-flex justify-center rounded-md border border-transparent bg-violet-700 py-2 px-4 font-medium text-white shadow-sm hover:bg-violet-800 focus:outline-none focus:ring-2 focus:ring-violet-500 focus:ring-offset-2">
                Save
            </button>
        </div>
    </div>
</form>
