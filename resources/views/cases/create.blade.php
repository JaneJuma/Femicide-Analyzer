<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Report a Femicide Case
        </h2>
    </x-slot>

    <div class="max-w-3xl mx-auto py-8 px-4">
        @if(session('success'))
        <div class="mb-4 p-3 bg-green-100 border border-green-300 text-green-800 rounded">
            {{ session('success') }}
        </div>
        @endif

        @if ($errors->any())
        <div class="mb-4 text-red-600">
            <ul>
                @foreach ($errors->all() as $error)
                <li>- {{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        <form method="POST" action="{{ route('cases.store') }}" class="space-y-6">
            @csrf

            <!-- Victim Info -->
            <div>
                <h3 class="text-lg font-semibold mb-2">Victim Information</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Full Name</label>
                        <input type="text" name="victim_name" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Age</label>
                        <input type="number" name="victim_age" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Occupation</label>
                        <input type="text" name="victim_occupation" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Marital Status</label>
                        <input type="text" name="victim_marital_status" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Education Level</label>
                        <input type="text" name="victim_education_level" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                </div>
            </div>

            <!-- Perpetrator Info -->
            <div>
                <h3 class="text-lg font-semibold mb-2">Perpetrator Information</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Full Name</label>
                        <input type="text" name="perpetrator_name" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Age</label>
                        <input type="number" name="perpetrator_age" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Relationship to Victim</label>
                        <input type="text" name="relationship_to_victim" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Occupation</label>
                        <input type="text" name="perpetrator_occupation" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Known to Victim?</label>
                        <div class="mt-1 flex items-center space-x-4">
                            <label class="inline-flex items-center">
                                <input type="radio" name="known_to_victim" value="1" class="text-red-600">
                                <span class="ml-2 text-sm text-gray-700">Yes</span>
                            </label>
                            <label class="inline-flex items-center">
                                <input type="radio" name="known_to_victim" value="0" class="text-red-600">
                                <span class="ml-2 text-sm text-gray-700">No</span>
                            </label>
                        </div>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Status</label>
                        <select name="perpetrator_status" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                            <option value="">Select</option>
                            <option value="at_large">At Large</option>
                            <option value="arrested">Arrested</option>
                            <option value="charged">Charged</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Case Info -->
            <div>
                <h3 class="text-lg font-semibold mb-2">Case Details</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Date of Incident</label>
                        <input type="date" name="date" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Method of Killing</label>
                        <input type="text" name="method" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm" required>
                    </div>
                    <div class="md:col-span-2">
                        <label class="block text-sm font-medium text-gray-700">Description</label>
                        <textarea name="description" rows="4" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm"></textarea>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">OB Number (if reported)</label>
                        <input type="text" name="ob_number" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                    </div>
                </div>
            </div>

            <!-- Location Info -->
            <div>
                <div class="mb-4">
                    <label for="county" class="block text-sm font-medium text-gray-700">County</label>
                    <select name="county" id="county" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                        <option value="">-- Select County --</option>
                        @foreach ($counties as $county)
                        <option value="{{ $county->county }}">{{ $county->county }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="mb-4">
                    <label for="location_type" class="block text-sm font-medium text-gray-700">Location Type</label>
                    <select name="location_type" id="location_type" required class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                        <option value="">-- Select Location Type --</option>
                        @foreach ($locationTypes as $type)
                        <option value="{{ $type->location_type }}">{{ $type->location_type }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <!-- Submit -->
            <div class="pt-6">
                <button type="submit" class="bg-red-600 text-white px-6 py-2 rounded hover:bg-red-700">
                    Submit Case
                </button>
            </div>
        </form>
    </div>
</x-app-layout>