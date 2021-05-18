<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ReadingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'hole_id' => $this->hole_id,
            'depth' => $this->depth,
            'dip' => $this->dip,
            'azimuth' => $this->azimuth,
            'is_trustworthy' => $this->is_trustworthy,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
