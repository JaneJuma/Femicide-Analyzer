<x-app-layout>

    <div class="max-w-7xl mx-auto py-8 px-4">
        <h1 class="text-2xl font-bold mb-6 text-red-600">All Reported Cases</h1>

        <div class="overflow-x-auto bg-white shadow rounded-lg">

            <form method="GET" action="{{ route('cases.index') }}" class="mb-6 bg-white p-4 rounded shadow grid grid-cols-1 md:grid-cols-4 gap-4">
                <!-- County Filter -->
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

                <!-- Location Type Filter -->
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

                <!-- Age Range Filter -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Age Range</label>
                    <div class="flex space-x-2">
                        <input type="number" name="age_min" value="{{ request('age_min') }}" placeholder="Min" class="w-1/2 border-gray-300 rounded">
                        <input type="number" name="age_max" value="{{ request('age_max') }}" placeholder="Max" class="w-1/2 border-gray-300 rounded">
                    </div>
                </div>

                <!-- Filter Button -->
                <div class="flex items-end">
                    <button type="submit" class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700">
                        Apply Filters
                    </button>
                </div>
            </form>

            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Victim</th>
                        <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Age</th>
                        <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Perpetrator</th>
                        <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">County</th>
                        <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Location Type</th>
                        <th class="px-6 py-3 text-left text-sm font-medium text-gray-700">Date</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    @forelse($cases as $case)
                    <tr>
                        <td class="px-6 py-4 text-sm text-gray-900">
                            {{ $case->victim->victim_name ?? 'N/A' }}
                        </td>
                        <td class="px-6 py-4 text-sm text-gray-900">
                            {{ $case->victim->victim_age ?? 'N/A' }}
                        </td>
                        <td class="px-6 py-4 text-sm text-gray-900">
                            {{ $case->perpetrator->perpetrator_name ?? 'N/A' }}
                        </td>
                        <td class="px-6 py-4 text-sm text-gray-900">
                            {{ $case->location->county ?? 'N/A' }}
                        </td>
                        <td class="px-6 py-4 text-sm text-gray-900">
                            {{ $case->location->location_type ?? 'N/A' }}
                        </td>
                        <td class="px-6 py-4 text-sm text-gray-900">
                            {{ \Carbon\Carbon::parse($case->date)->format('d M Y') }}
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="px-6 py-4 text-center text-gray-500">
                            No cases found.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="mt-6">
            {{ $cases->links() }}
        </div>
    </div>
</x-app-layout>