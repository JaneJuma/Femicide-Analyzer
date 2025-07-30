@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Submit Femicide Case</h2>

    <form method="POST" action="{{ route('cases.store') }}">
        @csrf

        <div class="mb-3">
            <label for="victim_name" class="form-label">Victim Name</label>
            <input type="text" name="victim_name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="age" class="form-label">Victim Age</label>
            <input type="number" name="age" class="form-control">
        </div>

        <div class="mb-3">
            <label for="date" class="form-label">Date of Incident</label>
            <input type="date" name="date" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="method" class="form-label">Method Used</label>
            <input type="text" name="method" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="ob_number" class="form-label">OB Number (if reported)</label>
            <input type="text" name="ob_number" class="form-control">
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Case Description</label>
            <textarea name="description" class="form-control" rows="4"></textarea>
        </div>

        <div class="mb-3">
            <label for="location_id" class="form-label">Location</label>
            <select name="location_id" class="form-control" required>
                @foreach($locations as $location)
                <option value="{{ $location->id }}">{{ $location->county }}</option>
                @endforeach
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Submit Case</button>
    </form>
</div>
@endsection