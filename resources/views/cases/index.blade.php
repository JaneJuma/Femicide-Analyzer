<x-app-layout>
    <div class="max-w-7xl mx-auto py-8 px-4">

        <h1 class="text-2xl font-bold text-red-600 mb-6">Reported Cases</h1>

        <!-- Filters -->
        <form method="GET" action="{{ route('cases.index') }}" class="mb-6 bg-white p-4 rounded shadow grid grid-cols-1 md:grid-cols-4 gap-4">
            <!-- County -->
            <div>
                <label for="county" class="block text-sm font-medium text-gray-700">County</label>
                <select name="county" id="county" class="mt-1 block w-full border-gray-300 rounded">
                    <option value="">All</option>
                    @foreach($counties as $county)
                    <option value="{{ $county }}" {{ request('county') == $county ? 'selected' : '' }}>
                        {{ $county }}
                    </option>
                    @endforeach
                </select>
            </div>

            <!-- Location Type -->
            <div>
                <label for="location_type" class="block text-sm font-medium text-gray-700">Location Type</label>
                <select name="location_type" id="location_type" class="mt-1 block w-full border-gray-300 rounded">
                    <option value="">All</option>
                    @foreach($locationTypes as $type)
                    <option value="{{ $type }}" {{ request('location_type') == $type ? 'selected' : '' }}>
                        {{ $type }}
                    </option>
                    @endforeach
                </select>
            </div>

            <!-- Age Range -->
            <div>
                <label class="block text-sm font-medium text-gray-700">Age Range</label>
                <div class="flex space-x-2">
                    <input type="number" name="age_min" value="{{ request('age_min') }}" placeholder="Min" class="w-1/2 border-gray-300 rounded">
                    <input type="number" name="age_max" value="{{ request('age_max') }}" placeholder="Max" class="w-1/2 border-gray-300 rounded">
                </div>
            </div>

            <!-- Button -->
            <div class="flex items-end">
                <button type="submit" class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700">
                    Apply Filters
                </button>
            </div>
        </form>

        <!-- Export Buttons -->
        <div class="flex space-x-4 mb-6">
            <a href="{{ route('cases.export.csv') }}"
                class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">
                Export Cases (CSV)
            </a>

            <a href="{{ route('cases.export.pdf') }}"
                class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700">
                Export Cases (PDF)
            </a>
        </div>


        <!-- Cases List -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            @forelse($cases as $case)
            <div class="bg-white shadow rounded-lg p-6 hover:shadow-lg transition">
                <h2 class="text-lg font-bold text-gray-800 mb-2">
                    {{ $case->victim->victim_name ?? 'Unknown Victim' }}
                </h2>
                <p class="text-sm text-gray-600">
                    <strong>Age:</strong> {{ $case->victim->victim_age ?? 'N/A' }}
                </p>
                <p class="text-sm text-gray-600">
                    <strong>County:</strong> {{ $case->location->county ?? 'N/A' }}
                </p>
                <p class="text-sm text-gray-600">
                    <strong>Location Type:</strong> {{ $case->location->location_type ?? 'N/A' }}
                </p>
                <p class="text-sm text-gray-600">
                    <strong>Date:</strong> {{ \Carbon\Carbon::parse($case->date)->format('d M Y') }}
                </p>

                <div class="mt-4 flex justify-between items-center">
                    @php
                    $status = strtolower($case->perpetrator->perpetrator_status ?? 'unknown');

                    $badgeClasses = match($status) {
                    'arrested' => 'bg-green-100 text-green-800',
                    'charged' => 'bg-blue-100 text-blue-800',
                    'at_large' => 'bg-red-100 text-red-800',
                    default => 'bg-gray-100 text-gray-800',
                    };
                    @endphp

                    <span class="px-2 py-1 text-xs font-medium rounded-full {{ $badgeClasses }}">
                        {{ ucfirst(str_replace('_', ' ', $status)) }}
                    </span>


                    <a href="{{ route('cases.show', $case->id) }}" class="text-red-600 hover:underline text-sm font-semibold">
                        View Details →
                    </a>
                </div>
            </div>
            @empty
            <p class="text-gray-600">No cases found.</p>
            @endforelse
        </div>

        <!-- Pagination -->
        <div class="mt-6">
            {{ $cases->links() }}
        </div>

    </div>
</x-app-layout>