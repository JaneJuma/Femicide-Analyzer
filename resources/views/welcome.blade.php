<x-guest-layout>
    <div class="text-center py-16">
        <!-- <img src="{{ asset('images/femicide-logo.png') }}"
            alt="Logo"
            class="h-[120px] w-auto mx-auto mb-6"
            style="height: 80px !important; width: auto;"> -->
        <h1 class="text-4xl font-bold text-red-600 mb-4">
            Femicide Crime Pattern Analyzer
        </h1>
        <p class="text-lg text-gray-700 mb-8">
            A system to analyze and report femicide cases across Kenya.
        </p>
        <div class="space-x-4">
            <a href="{{ route('login') }}"
                class="bg-red-600 text-white px-6 py-3 rounded-lg hover:bg-red-700">
                Login
            </a>
            <a href="{{ route('register') }}"
                class="bg-gray-200 text-gray-900 px-6 py-3 rounded-lg hover:bg-gray-300">
                Register
            </a>
        </div>
    </div>
</x-guest-layout>