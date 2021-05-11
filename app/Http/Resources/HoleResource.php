<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class HoleResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {

		// 
		// For each depth reading, indicate whether it is trustworthy or not using these rules:
		// a. The azimuth is within 5 degrees of the previous depth's azimuth reading.
		// b. The dip is within 3 degrees of the average dip from the previous 5 depth readings.
		// 

		$result = [];
		$readings = $this->readings;
		$prev_azimuth = 0;
		$prev_5_dip = [];
		$ii = 1;
		foreach($readings as $r){

			$rule_a = ($ii==1) || (abs($r->azimuth - $prev_azimuth) <=5 );

			if($ii > 1){
				$a = array_filter($prev_5_dip);
				if(count($a)) {
					$avg_prev_5_dip = array_sum($a)/count($a);
				}
				$rule_b = (abs($r->dip - $avg_prev_5_dip) <=3 );
			}else {
				$rule_b = true;
			}

			$is_trustworthy = ($rule_a && $rule_b)===true? 1: 0;

			$result[] = array(
                "id" => $r->id,
                "hole_id" => $r->hole_id,
                "depth" => $r->depth,
                "dip" => $r->dip,
                "azimuth" => $r->azimuth,
                "is_trustworthy" => $is_trustworthy,
			);

			$prev_azimuth = $r->azimuth;
			$prev_5_dip[] = $r->dip;
			
			if(count($prev_5_dip) > 5){
				// Deleting first array item
				$removed = array_shift($prev_5_dip);
			}

			$ii++;
		}
		
        return [
            'id' => $this->id,
            'latitude' => $this->latitude,
            'longitude' => $this->longitude,
            'dip' => $this->dip,
            'azimuth' => $this->azimuth,
            'readings' => $result,
        ];
    }
}
