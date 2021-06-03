<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateReadingRequest;
use App\Http\Requests\UpdateReadingRequest;
use App\Repositories\ReadingRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class ReadingController extends AppBaseController
{
    /** @var  ReadingRepository */
    private $readingRepository;

    public function __construct(ReadingRepository $readingRepo)
    {
        $this->readingRepository = $readingRepo;
    }

    /**
     * Display a listing of the Reading.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $readings = $this->readingRepository->all();

        return view('readings.index')
            ->with('readings', $readings);
    }

    /**
     * Show the form for creating a new Reading.
     *
     * @return Response
     */
    public function create()
    {
        return view('readings.create');
    }

    /**
     * Store a newly created Reading in storage.
     *
     * @param CreateReadingRequest $request
     *
     * @return Response
     */
    public function store(CreateReadingRequest $request)
    {
        $input = $request->all();

        $reading = $this->readingRepository->create($input);

        Flash::success('Reading saved successfully.');

        return redirect(route('readings.index'));
    }

    /**
     * Display the specified Reading.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $reading = $this->readingRepository->find($id);

        if (empty($reading)) {
            Flash::error('Reading not found');

            return redirect(route('readings.index'));
        }

        return view('readings.show')->with('reading', $reading);
    }

    /**
     * Show the form for editing the specified Reading.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $reading = $this->readingRepository->find($id);

        if (empty($reading)) {
            Flash::error('Reading not found');

            return redirect(route('readings.index'));
        }

        return view('readings.edit')->with('reading', $reading);
    }

    /**
     * Update the specified Reading in storage.
     *
     * @param int $id
     * @param UpdateReadingRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateReadingRequest $request)
    {
        $reading = $this->readingRepository->find($id);

        if (empty($reading)) {
            Flash::error('Reading not found');

            return redirect(route('readings.index'));
        }

        $reading = $this->readingRepository->update($request->all(), $id);

        Flash::success('Reading updated successfully.');

        return redirect(route('readings.index'));
    }

    /**
     * Remove the specified Reading from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $reading = $this->readingRepository->find($id);

        if (empty($reading)) {
            Flash::error('Reading not found');

            return redirect(route('readings.index'));
        }

        $this->readingRepository->delete($id);

        Flash::success('Reading deleted successfully.');

        return redirect(route('readings.index'));
    }
}
