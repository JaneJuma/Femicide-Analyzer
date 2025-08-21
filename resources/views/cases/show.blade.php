<x-app-layout>
    <div class="max-w-4xl mx-auto py-8 px-4">
        <h1 class="text-2xl font-bold text-red-600 mb-6">Case Details</h1>

        <div class="bg-white p-6 rounded shadow space-y-6">
            <!-- Victim Information -->
            <div>
                <h2 class="text-lg font-semibold mb-2 text-gray-700">Victim Information</h2>
                <p><strong>Name:</strong> {{ $case->victim->victim_name ?? 'N/A' }}</p>
                <p><strong>Age:</strong> {{ $case->victim->victim_age ?? 'N/A' }}</p>
                <p><strong>Occupation:</strong> {{ $case->victim->victim_occupation ?? 'N/A' }}</p>
                <p><strong>Marital Status:</strong> {{ $case->victim->victim_marital_status ?? 'N/A' }}</p>
                <p><strong>Education Level:</strong> {{ $case->victim->victim_education_level ?? 'N/A' }}</p>
            </div>

            <!-- Perpetrator Information -->
            <div>
                <h2 class="text-lg font-semibold mb-2 text-gray-700">Perpetrator Information</h2>
                <p><strong>Name:</strong> {{ $case->perpetrator->perpetrator_name ?? 'N/A' }}</p>
                <p><strong>Age:</strong> {{ $case->perpetrator->perpetrator_age ?? 'N/A' }}</p>
                <p><strong>Relationship to Victim:</strong> {{ $case->perpetrator->relationship_to_victim ?? 'N/A' }}</p>
                <p><strong>Occupation:</strong> {{ $case->perpetrator->perpetrator_occupation ?? 'N/A' }}</p>
                <p><strong>Known to Victim:</strong> {{ $case->perpetrator->known_to_victim ?? 'N/A' }}</p>
                <p><strong>Status:</strong> {{ $case->perpetrator->perpetrator_status ?? 'N/A' }}</p>
            </div>

            <!-- Case Information -->
            <div>
                <h2 class="text-lg font-semibold mb-2 text-gray-700">Case Details</h2>
                <p><strong>Date of Incident:</strong> {{ \Carbon\Carbon::parse($case->date)->format('d M Y') }}</p>
                <p><strong>Method of Killing:</strong> {{ $case->method }}</p>
                <p><strong>Description:</strong> {{ $case->description }}</p>
                <p><strong>OB Number:</strong> {{ $case->ob_number ?? 'N/A' }}</p>
            </div>

            <!-- Location Information -->
            <div>
                <h2 class="text-lg font-semibold mb-2 text-gray-700">Location</h2>
                <p><strong>County:</strong> {{ $case->location->county ?? 'N/A' }}</p>
                <p><strong>Location Type:</strong> {{ $case->location->location_type ?? 'N/A' }}</p>
            </div>

            <!-- Back Button -->
            <div class="pt-4">
                <a href="{{ route('cases.index') }}" class="bg-gray-600 text-white px-4 py-2 rounded hover:bg-gray-700">
                    Back to Cases
                </a>
            </div>
        </div>
    </div>
</x-app-layout>