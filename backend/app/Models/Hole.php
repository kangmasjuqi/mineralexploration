<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model as Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Reading;

/**
 * Class Hole
 * @package App\Models
 * @version April 24, 2021, 12:47 pm UTC
 *
 * @property string $latitude
 * @property string $longitude
 * @property number $dip
 * @property number $azimuth
 */
class Hole extends Model
{

    use HasFactory;

    public $table = 'holes';
    



    public $fillable = [
        'latitude',
        'longitude',
        'dip',
        'azimuth'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'latitude' => 'string',
        'longitude' => 'string',
        'dip' => 'float',
        'azimuth' => 'float'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'latitude' => 'required',
        'longitude' => 'required',
        'dip' => 'required',
        'azimuth' => 'required'
    ];

    public function readings()
    {
        return $this->hasMany(Reading::class)->orderBy('depth', 'asc')->limit(100);
    }

}
