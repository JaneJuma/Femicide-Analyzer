<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VictimModel extends Model
{
    use HasFactory;

    protected $table = 'victims';

    // Victim.php
    protected $fillable = [
        'victim_name',
        'victim_age',
        'victim_occupation',
        'victim_marital_status',
        'victim_education_level'
    ];

    //Rekationship
    public function cases()
    {
        return $this->hasMany(CaseModel::class);
    }
}
