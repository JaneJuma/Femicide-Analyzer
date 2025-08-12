<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PerpetratorModel extends Model
{
    use HasFactory;

    protected $table = 'perpetrators';
    // Perpetrator.php
    protected $fillable = [
        'perpetrator_name',
        'perpetrator_age',
        'relationship_to_victim',
        'perpetrator_occupation',
        'known_to_victim',
        'perpetrator_status'
    ];

    //Relationship

    public function cases()
    {
        return $this->hasMany(CaseModel::class);
    }
}
