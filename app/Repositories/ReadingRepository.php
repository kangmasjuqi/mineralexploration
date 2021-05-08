<?php

namespace App\Repositories;

use App\Models\Reading;
use App\Repositories\BaseRepository;

/**
 * Class ReadingRepository
 * @package App\Repositories
 * @version April 24, 2021, 12:51 pm UTC
*/

class ReadingRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'hole_id',
        'depth',
        'dip',
        'azimuth',
        'is_trustworthy'
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
        return Reading::class;
    }
}
