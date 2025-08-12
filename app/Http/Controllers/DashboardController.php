<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CaseModel;
use App\Models\Location;

class DashboardController extends Controller
{
    public function index()
    {
        // dd('Dashboard Controller Loaded'); // Test
        $totalCases = CaseModel::count();

        $arrestedCount = CaseModel::whereHas('perpetrator', function ($q) {
            $q->where('perpetrator_status', 'arrested');
        })->count();

        $casesThisMonth = CaseModel::whereMonth('date', now()->month)
            ->whereYear('date', now()->year)
            ->count();

        // Chart data: cases per month this year
        $casesPerMonth = CaseModel::selectRaw('MONTH(date) as month, COUNT(*) as count')
            ->whereYear('date', now()->year)
            ->groupBy('month')
            ->orderBy('month')
            ->pluck('count', 'month');

        // Cases by County (top 5)
        $casesByCounty = \App\Models\CaseModel::with('location')
            ->selectRaw('locations.county, COUNT(cases.id) as count')
            ->join('locations', 'cases.location_id', '=', 'locations.id')
            ->groupBy('locations.county')
            ->orderByDesc('count')
            ->limit(5)
            ->get();

        $countyLabels = $casesByCounty->pluck('county');
        $countyData = $casesByCounty->pluck('count');

        // Fill missing months with zero
        $chartLabels = [];
        $chartData = [];
        for ($m = 1; $m <= 12; $m++) {
            $chartLabels[] = date('F', mktime(0, 0, 0, $m, 1));
            $chartData[] = $casesPerMonth[$m] ?? 0;
        }
        // $arrestedPerpetrators = CaseModel::where('perpetrator_status', 'arrested')->count();
        // $verifiedCases = CaseModel::where('verified', true)->count();
        // $unverifiedCases = CaseModel::where('verified', false)->count();
        // $counties = Location::distinct('county')->count();

        $recentCases = CaseModel::with(['victim', 'location'])
            ->latest()
            ->take(10)
            ->get();

        return view('dashboard', compact(
            'totalCases',
            'recentCases',
            'arrestedCount',
            'casesThisMonth',
            'chartLabels',
            'chartData',
            'countyLabels',
            'countyData'
        ));
        return view('dashboard', compact('totalCases', 'arrestedPerpetrators', 'recentCases'));
    }
}
