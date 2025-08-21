<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Cases Report</title>
    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
            font-size: 12px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            border: 1px solid #000;
            padding: 6px;
            text-align: left;
        }

        th {
            background: #f2f2f2;
        }
    </style>
</head>

<body>
    <h2>Femicide Cases Report</h2>
    <table>
        <thead>
            <tr>
                <th>Victim</th>
                <th>Age</th>
                <th>Perpetrator</th>
                <th>Status</th>
                <th>County</th>
                <th>Date of Incident</th>
                <th>Method of Killing</th>
            </tr>
        </thead>
        <tbody>
            @foreach($cases as $case)
            <tr>
                <td>{{ $case->victim->victim_name ?? 'N/A' }}</td>
                <td>{{ $case->victim->victim_age ?? 'N/A' }}</td>
                <td>{{ $case->perpetrator->perpetrator_name ?? 'N/A' }}</td>
                <td>{{ $case->perpetrator_status ?? 'N/A' }}</td>
                <td>{{ $case->location->county ?? 'N/A' }}</td>
                <td>{{ $case->date }}</td>
                <td>{{ $case->method }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>

</html>