<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="font-sans antialiased">
    <div class="min-h-screen flex flex-col">

        <!-- Top Navbar (logo + profile) -->
        @include('layouts.navigation')

        <div class="flex flex-1">
            <!-- Sidebar -->
            <aside class="w-64 bg-white border-r shadow-sm">
                <nav class="p-4 space-y-2 overflow-y-auto h-full">
                    <a href="{{ route('dashboard') }}"
                        class="block px-4 py-2 rounded 
              {{ request()->routeIs('dashboard') ? 'bg-red-600 text-white' : 'hover:bg-red-100 text-gray-700' }}">
                        📊 Dashboard
                    </a>

                    <a href="{{ route('cases.index') }}"
                        class="block px-4 py-2 rounded 
              {{ request()->routeIs('cases.index') ? 'bg-red-600 text-white' : 'hover:bg-red-100 text-gray-700' }}">
                        📁 Cases
                    </a>

                    <a href="{{ route('cases.create') }}"
                        class="block px-4 py-2 rounded 
              {{ request()->routeIs('cases.create') ? 'bg-red-600 text-white' : 'hover:bg-red-100 text-gray-700' }}">
                        ➕ Add Case
                    </a>

                    <!-- <a href="{{ route('cases.export.csv') }}"
                        class="block px-4 py-2 rounded 
              {{ request()->routeIs('cases.export.csv') ? 'bg-red-600 text-white' : 'hover:bg-red-100 text-gray-700' }}">
                        📄 Export CSV
                    </a>

                    <a href="{{ route('cases.export.pdf') }}"
                        class="block px-4 py-2 rounded 
              {{ request()->routeIs('cases.export.pdf') ? 'bg-red-600 text-white' : 'hover:bg-red-100 text-gray-700' }}">
                        📑 Export PDF
                    </a> -->
                </nav>

            </aside>


            <!-- Main Content -->
            <main class="flex-1 bg-gray-100 p-6">
                {{ $slot }}
            </main>
        </div>
    </div>
</body>

</html>