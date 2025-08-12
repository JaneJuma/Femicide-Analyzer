<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CaseModel extends Model
{
    use HasFactory;

    protected $table = 'cases';

    // CaseModel.php
    protected $fillable = [
        'victim_id',
        'perpetrator_id',
        'location_id',
        'date',
        'method',
        'description',
        'ob_number',
        // 'county',
        // 'location_type',
        'user_id',
        // 'verified'
    ];

    //Relationship
    public function victim()
    {
        return $this->belongsTo(VictimModel::class);
    }

    // Perpetrator relationship
    public function perpetrator()
    {
        return $this->belongsTo(PerpetratorModel::class);
    }

    public function location()
    {
        return $this->belongsTo(Location::class);
    }
}
