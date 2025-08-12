<x-app-layout>
    <div class="max-w-7xl mx-auto py-8 px-4">
        <h2 class="text-2xl font-bold mb-6">Dashboard</h2>

        <!-- Stats -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="text-gray-500">Total Cases</h3>
                <p class="text-3xl font-bold">{{ $totalCases }}</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="text-gray-500">Arrested Perpetrators</h3>
                <p class="text-3xl font-bold">{{ $arrestedCount }}</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="text-gray-500">Cases This Month</h3>
                <p class="text-3xl font-bold">{{ $casesThisMonth }}</p>
            </div>
            <!-- Cases by County Chart -->
            <div class="bg-white p-6 rounded-lg shadow mb-8">
                <h3 class="text-lg font-semibold mb-4">Top 5 Counties by Cases</h3>
                <canvas id="countyChart" height="100"></canvas>
            </div>

        </div>

        <!-- Chart -->
        <div class="bg-white p-6 rounded-lg shadow mb-8">
            <h3 class="text-lg font-semibold mb-4">Cases Per Month ({{ date('Y') }})</h3>
            <canvas id="casesChart" height="100"></canvas>
        </div>

        <!-- Recent Cases Table -->
        <div class="bg-white p-6 rounded-lg shadow">
            <h3 class="text-lg font-semibold mb-4">Recent Cases</h3>
            <table class="min-w-full table-auto border-collapse">
                <thead>
                    <tr>
                        <th class="px-4 py-2 border">Victim</th>
                        <th class="px-4 py-2 border">Age</th>
                        <th class="px-4 py-2 border">Location</th>
                        <th class="px-4 py-2 border">Date</th>
                        <th class="px-4 py-2 border">Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($recentCases as $case)
                    <tr>
                        <td class="px-4 py-2 border">{{ $case->victim->victim_name ?? 'N/A' }}</td>
                        <td class="px-4 py-2 border">{{ $case->victim->victim_age ?? 'N/A' }}</td>
                        <td class="px-4 py-2 border">{{ $case->location->county ?? 'N/A' }}</td>
                        <td class="px-4 py-2 border">{{ $case->date }}</td>
                        <td class="px-4 py-2 border">{{ ucfirst($case->perpetrator->status ?? 'Unknown') }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('casesChart').getContext('2d');
        const casesChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: @json($chartLabels),
                datasets: [{
                    label: 'Cases',
                    data: @json($chartData),
                    borderColor: 'rgba(239, 68, 68, 1)',
                    backgroundColor: 'rgba(239, 68, 68, 0.2)',
                    borderWidth: 2,
                    fill: true,
                    tension: 0.3
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true
                    }
                }
            }
        });
    </script>
    <script>
        const countyCtx = document.getElementById('countyChart').getContext('2d');
        const countyChart = new Chart(countyCtx, {
            type: 'bar',
            data: {
                labels: @json($countyLabels),
                datasets: [{
                    label: 'Number of Cases',
                    data: @json($countyData),
                    backgroundColor: 'rgba(239, 68, 68, 0.7)',
                    borderColor: 'rgba(239, 68, 68, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

</x-app-layout>