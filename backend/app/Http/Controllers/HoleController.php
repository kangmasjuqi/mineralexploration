<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateHoleRequest;
use App\Http\Requests\UpdateHoleRequest;
use App\Repositories\HoleRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class HoleController extends AppBaseController
{
    /** @var  HoleRepository */
    private $holeRepository;

    public function __construct(HoleRepository $holeRepo)
    {
        $this->holeRepository = $holeRepo;
    }

    /**
     * Display a listing of the Hole.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $holes = $this->holeRepository->all();

        return view('holes.index')
            ->with('holes', $holes);
    }

    /**
     * Show the form for creating a new Hole.
     *
     * @return Response
     */
    public function create()
    {
        return view('holes.create');
    }

    /**
     * Store a newly created Hole in storage.
     *
     * @param CreateHoleRequest $request
     *
     * @return Response
     */
    public function store(CreateHoleRequest $request)
    {
        $input = $request->all();

        $hole = $this->holeRepository->create($input);

        Flash::success('Hole saved successfully.');

        return redirect(route('holes.index'));
    }

    /**
     * Display the specified Hole.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $hole = $this->holeRepository->find($id);

        if (empty($hole)) {
            Flash::error('Hole not found');

            return redirect(route('holes.index'));
        }

        return view('holes.show')->with('hole', $hole);
    }

    /**
     * Show the form for editing the specified Hole.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $hole = $this->holeRepository->find($id);

        if (empty($hole)) {
            Flash::error('Hole not found');

            return redirect(route('holes.index'));
        }

        return view('holes.edit')->with('hole', $hole);
    }

    /**
     * Update the specified Hole in storage.
     *
     * @param int $id
     * @param UpdateHoleRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateHoleRequest $request)
    {
        $hole = $this->holeRepository->find($id);

        if (empty($hole)) {
            Flash::error('Hole not found');

            return redirect(route('holes.index'));
        }

        $hole = $this->holeRepository->update($request->all(), $id);

        Flash::success('Hole updated successfully.');

        return redirect(route('holes.index'));
    }

    /**
     * Remove the specified Hole from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $hole = $this->holeRepository->find($id);

        if (empty($hole)) {
            Flash::error('Hole not found');

            return redirect(route('holes.index'));
        }

        $this->holeRepository->delete($id);

        Flash::success('Hole deleted successfully.');

        return redirect(route('holes.index'));
    }
}
