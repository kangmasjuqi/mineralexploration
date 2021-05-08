<?php

namespace App\Repositories;

use App\Models\Hole;
use App\Repositories\BaseRepository;

/**
 * Class HoleRepository
 * @package App\Repositories
 * @version April 24, 2021, 12:47 pm UTC
*/

class HoleRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'latitude',
        'longitude',
        'dip',
        'azimuth'
    ];

    /**
     * Return searchable fields
     *
     * @return array
     */
    public function getFieldsSearchable()
    {
        return $this->fieldSearchable;
    }

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Hole::class;
    }

}
