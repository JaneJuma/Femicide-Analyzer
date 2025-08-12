<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\VictimModel;
use App\Models\PerpetratorModel;
use App\Models\Location;
use App\Models\CaseModel;
use Illuminate\Support\Facades\Auth;

class CaseController extends Controller
{
    public function index(Request $request)
    {
        // Pull cases with victim, perpetrator & location
        $cases = CaseModel::with(['victim', 'perpetrator', 'location'])
            ->latest()
            ->paginate(10); // paginate 10 per page

        $query = CaseModel::with(['victim', 'perpetrator', 'location']);

        // Filter by county
        if ($request->filled('county')) {
            $query->whereHas('location', function ($q) use ($request) {
                $q->where('county', $request->county);
            });
        }

        // Filter by location type
        if ($request->filled('location_type')) {
            $query->whereHas('location', function ($q) use ($request) {
                $q->where('location_type', $request->location_type);
            });
        }

        // Filter by victim age range
        if ($request->filled('age_min') && $request->filled('age_max')) {
            $query->whereHas('victim', function ($q) use ($request) {
                $q->whereBetween('victim_age', [$request->age_min, $request->age_max]);
            });
        }

        $cases = $query->latest()->paginate(10);

        // Fetch distinct counties and location types for dropdowns
        $counties = \App\Models\Location::select('county')->distinct()->pluck('county');
        $locationTypes = \App\Models\Location::select('location_type')->distinct()->pluck('location_type');

        return view('cases.index', compact('cases', 'counties', 'locationTypes'));
    }

    public function create()
    {
        $counties = Location::select('county')->distinct()->get();
        $locationTypes = Location::select('location_type')->distinct()->get();

        return view('cases.create', compact('counties', 'locationTypes'));
    }
    public function store(Request $request)
    {
        // dd($request->all());
        // Validate input
        $request->validate([
            //Location
            'county' => 'required|string',
            'location_type' => 'required|string',

            // Victim
            'victim_name' => 'required|string|max:255',
            'victim_age' => 'nullable|integer|min:0',
            'victim_occupation' => 'nullable|string|max:255',
            'victim_marital_status' => 'nullable|string|max:255',
            'victim_education_level' => 'nullable|string|max:255',

            // Perpetrator
            'perpetrator_name' => 'nullable|string|max:255',
            'perpetrator_age' => 'nullable|integer|min:0',
            'relationship_to_victim' => 'nullable|string|max:255',
            'perpetrator_occupation' => 'nullable|string|max:255',
            'known_to_victim' => 'required|boolean',
            'perpetrator_status' => 'nullable|in:at_large,arrested,charged',

            // Case
            'date' => 'required|date',
            'method' => 'required|string|max:255',
            'description' => 'nullable|string',
            'ob_number' => 'nullable|string|max:255',
            // 'location_id' => 'required|exists:locations,id',

        ]);

        // 1. Create Location First (So you have the ID)
        $location = Location::create([
            'county' => $request->county,
            'location_type' => $request->location_type,
        ]);

        // 2. Create Victim
        $victim = VictimModel::create([
            'victim_name' => $request->victim_name,
            'victim_age' => $request->victim_age,
            'victim_occupation' => $request->victim_occupation,
            'victim_marital_status' => $request->victim_marital_status,
            'victim_education_level' => $request->victim_education_level,
        ]);

        // 3. Create Perpetrator if provided
        $perpetrator = null;
        if ($request->filled('perpetrator_name')) {
            $perpetrator = PerpetratorModel::create([
                'perpetrator_name' => $request->perpetrator_name,
                'relationship_to_victim' => $request->relationship_to_victim,
                'perpetrator_age' => $request->perpetrator_age,
                'perpetrator_occupation' => $request->perpetrator_occupation,
                'known_to_victim' => $request->known_to_victim ?? false,
                'perpetrator_status' => $request->perpetrator_status ?? 'at_large',
            ]);
        }

        // 4. Create Case
        CaseModel::create([
            'victim_id' => $victim->id,
            'perpetrator_id' => $perpetrator?->id,
            'location_id' => $location->id,
            'date' => $request->date,
            'method' => $request->method,
            'description' => $request->description,
            'ob_number' => $request->ob_number,
            'user_id' => Auth::id(),
            // 'verified' => false,
        ]);


        return redirect()->route('cases.create')->with('success', 'Case submitted successfully.');
    }
}
