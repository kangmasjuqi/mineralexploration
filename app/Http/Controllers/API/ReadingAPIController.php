<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateReadingAPIRequest;
use App\Http\Requests\API\UpdateReadingAPIRequest;
use App\Models\Reading;
use App\Repositories\ReadingRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;
use App\Http\Resources\ReadingResource;
use Response;

/**
 * Class ReadingController
 * @package App\Http\Controllers\API
 */

class ReadingAPIController extends AppBaseController
{
    /** @var  ReadingRepository */
    private $readingRepository;

    public function __construct(ReadingRepository $readingRepo)
    {
        $this->readingRepository = $readingRepo;
    }

    /**
     * Display a listing of the Reading.
     * GET|HEAD /readings
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $readings = $this->readingRepository->all(
            $request->except(['skip', 'limit']),
            $request->get('skip'),
            $request->get('limit')
        );

        return $this->sendResponse(ReadingResource::collection($readings), 'Readings retrieved successfully');
    }

    /**
     * Store a newly created Reading in storage.
     * POST /readings
     *
     * @param CreateReadingAPIRequest $request
     *
     * @return Response
     */
    public function store(CreateReadingAPIRequest $request)
    {
        $input = $request->all();

        $reading = $this->readingRepository->create($input);

        return $this->sendResponse(new ReadingResource($reading), 'Reading saved successfully');
    }

    /**
     * Display the specified Reading.
     * GET|HEAD /readings/{id}
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var Reading $reading */
        $reading = $this->readingRepository->find($id);

        if (empty($reading)) {
            return $this->sendError('Reading not found');
        }

        return $this->sendResponse(new ReadingResource($reading), 'Reading retrieved successfully');
    }

    /**
     * Update the specified Reading in storage.
     * PUT/PATCH /readings/{id}
     *
     * @param int $id
     * @param UpdateReadingAPIRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateReadingAPIRequest $request)
    {
        $input = $request->all();

        /** @var Reading $reading */
        $reading = $this->readingRepository->find($id);

        if (empty($reading)) {
            return $this->sendError('Reading not found');
        }

        $reading = $this->readingRepository->update($input, $id);

        return $this->sendResponse(new ReadingResource($reading), 'Reading updated successfully');
    }

    /**
     * Remove the specified Reading from storage.
     * DELETE /readings/{id}
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var Reading $reading */
        $reading = $this->readingRepository->find($id);

        if (empty($reading)) {
            return $this->sendError('Reading not found');
        }

        $reading->delete();

        return $this->sendSuccess('Reading deleted successfully');
    }
}
