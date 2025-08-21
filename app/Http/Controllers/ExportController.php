<?php

namespace App\Http\Controllers;

use App\Models\CaseModel;
use Illuminate\Http\Response;
use Barryvdh\DomPDF\Facade\Pdf;


class ExportController extends Controller
{
    public function exportCsv()
    {
        $cases = CaseModel::with(['victim', 'perpetrator', 'location'])->get();

        $filename = "cases_" . date('Y-m-d') . ".csv";

        $headers = [
            "Content-Type" => "text/csv",
            "Content-Disposition" => "attachment; filename=$filename",
        ];

        $callback = function () use ($cases) {
            $file = fopen('php://output', 'w');

            // Header row
            fputcsv($file, ['Victim Name', 'Victim Age', 'Perpetrator Name', 'Status', 'County', 'Location Type', 'Date', 'Method', 'Description']);

            // Data rows
            foreach ($cases as $case) {
                fputcsv($file, [
                    $case->victim->name ?? 'N/A',
                    $case->victim->age ?? 'N/A',
                    $case->perpetrator->name ?? 'N/A',
                    $case->perpetrator->status ?? 'N/A',
                    $case->location->county ?? 'N/A',
                    $case->location->location_type ?? 'N/A',
                    $case->date,
                    $case->method,
                    $case->description,
                ]);
            }

            fclose($file);
        };

        return response()->stream($callback, 200, $headers);
    }
}
