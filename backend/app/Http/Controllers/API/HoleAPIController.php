<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateHoleAPIRequest;
use App\Http\Requests\API\UpdateHoleAPIRequest;
use App\Models\Hole;
use App\Models\Reading;
use App\Repositories\HoleRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;
use App\Http\Resources\HoleResource;
use Response;

/**
 * Class HoleController
 * @package App\Http\Controllers\API
 */

class HoleAPIController extends AppBaseController
{
    /** @var  HoleRepository */
    private $holeRepository;

    public function __construct(HoleRepository $holeRepo)
    {
        $this->holeRepository = $holeRepo;
    }

    /**
     * Display a listing of the Hole.
     * GET|HEAD /holes
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $holes = $this->holeRepository->all(
            $request->except(['skip', 'limit']),
            $request->get('skip'),
            $request->get('limit')
        );

        return $this->sendResponse(HoleResource::collection($holes), 'Holes retrieved successfully');
    }

    /**
     * Store a newly created Hole in storage.
     * POST /holes
     *
     * @param CreateHoleAPIRequest $request
     *
     * @return Response
     */
    public function store(CreateHoleAPIRequest $request)
    {
        $input = $request->all();

        $hole = $this->holeRepository->create($input);

        return $this->sendResponse(new HoleResource($hole), 'Hole saved successfully');
    }

    /**
     * Display the specified Hole.
     * GET|HEAD /holes/{id}
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var Hole $hole */
        $hole = $this->holeRepository->find($id);

        if (empty($hole)) {
            return $this->sendError('Hole not found');
        }

		$holeResource = new HoleResource($hole);

		$holeResource = $this->get_list_reading($holeResource, $hole);

        return $this->sendResponse($holeResource, 'Hole retrieved successfully');
    }

	private function get_list_reading($holeResource, $hole)
	{

		// RULES:
		// 
		// For each depth reading, indicate whether it is trustworthy or not using these rules:
		// a. The azimuth is within 5 degrees of the previous depth's azimuth reading.
		// b. The dip is within 3 degrees of the average dip from the previous 5 depth readings.
		// 

		$result = [];
		$readings = $holeResource->readings;
		$prev_azimuth = $hole->azimuth;		// set hole->azimuth as the initial "prev_azimuth"
		$prev_5_dip = [$hole->dip];			// set hole->dip as the first element of array "prev_5_dip"
		$ii = 1;
		foreach($readings as $r){

			// rule a
				$rule_a = (abs($r->azimuth - $prev_azimuth) <=5 );

			// rule b
				$a = array_filter($prev_5_dip);
				if(count($a)) {
					$avg_prev_5_dip = array_sum($a)/count($a);
				}
				$rule_b = (abs($r->dip - $avg_prev_5_dip) <=3 );

			// calculate trustworthy based on rule a & rule b
			$is_trustworthy = ($rule_a && $rule_b)===true? 1: 0;

			$result[] = array(
                "id" => $r->id,
                "hole_id" => $r->hole_id,
                "depth" => $r->depth,
                "dip" => $r->dip,
                "azimuth" => $r->azimuth,
                "is_trustworthy" => $is_trustworthy,
                "is_trustworthy_rule_check" => array(
					"previous_azimuth" => $prev_azimuth,
					"average_dip_of_previous_5_depth_readings" => $avg_prev_5_dip,
				)
			);

			$prev_azimuth = $r->azimuth;
			$prev_5_dip[] = $r->dip;
			
			if(count($prev_5_dip) > 5){
				// Deleting first array item, keep the recent 5 data
				$removed = array_shift($prev_5_dip);
			}

			$ii++;
		}
		
        return [
            'id' => $holeResource->id,
            'latitude' => $holeResource->latitude,
            'longitude' => $holeResource->longitude,
            'dip' => $holeResource->dip,
            'azimuth' => $holeResource->azimuth,
            'readings' => $result
        ];
	}

    /**
     * Update the specified Hole in storage.
     * PUT/PATCH /holes/{id}
     *
     * @param int $id
     * @param UpdateHoleAPIRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateHoleAPIRequest $request)
    {
        $input = $request->all();

        /** @var Hole $hole */
        $hole = $this->holeRepository->find($id);

        if (empty($hole)) {
            return $this->sendError('Hole not found');
        }

        $hole = $this->holeRepository->update($input, $id);

        return $this->sendResponse(new HoleResource($hole), 'Hole updated successfully');
    }

    /**
     * Remove the specified Hole from storage.
     * DELETE /holes/{id}
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var Hole $hole */
        $hole = $this->holeRepository->find($id);

        if (empty($hole)) {
            return $this->sendError('Hole not found');
        }

        $hole->delete();

        return $this->sendSuccess('Hole deleted successfully');
    }
}
