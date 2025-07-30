<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CaseModel; // Assuming your model is named CaseModel (not Case)
use App\Models\Location;
use Illuminate\Support\Facades\Auth;

class CaseController extends Controller
{
    public function create()
    {
        $locations = Location::all();
        return view('cases.create', compact('locations'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'victim_name' => 'required|string|max:255',
            'age' => 'nullable|integer|min:1',
            'date' => 'required|date',
            'method' => 'required|string|max:255',
            'description' => 'nullable|string',
            'ob_number' => 'nullable|string|max:255',
            'location_id' => 'required|exists:locations,id',
        ]);

        CaseModel::create([
            'victim_name' => $request->victim_name,
            'age' => $request->age,
            'date' => $request->date,
            'method' => $request->method,
            'description' => $request->description,
            'ob_number' => $request->ob_number,
            'location_id' => $request->location_id,
            'user_id' => Auth::id(),
            'verified' => false,
        ]);
        // return view('cases.create', compact('locations'));
        return redirect()->route('dashboard')->with('success', 'Case submitted successfully and is pending verification.');
    }
}
