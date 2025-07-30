<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CaseModel extends Model
{
    use HasFactory;

    protected $table = 'cases';

    protected $fillable = [
        'victim_name',
        'age',
        'date',
        'method',
        'description',
        'ob_number',
        'location_id',
        'user_id',
        'verified',
    ];
}
