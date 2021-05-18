<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model as Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Hole;


/**
 * Class Reading
 * @package App\Models
 * @version April 24, 2021, 12:51 pm UTC
 *
 * @property integer $hole_id
 * @property number $depth
 * @property number $dip
 * @property number $azimuth
 * @property integer $is_trustworthy
 */
class Reading extends Model
{

    use HasFactory;

    public $table = 'readings';
    



    public $fillable = [
        'hole_id',
        'depth',
        'dip',
        'azimuth',
        'is_trustworthy'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'hole_id' => 'integer',
        'depth' => 'float',
        'dip' => 'float',
        'azimuth' => 'float',
        'is_trustworthy' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'hole_id' => 'required',
        'depth' => 'required',
        'dip' => 'required',
        'azimuth' => 'required'
    ];

    public function hole()
    {
        return $this->belongsTo(Hole::class);
    }
}
