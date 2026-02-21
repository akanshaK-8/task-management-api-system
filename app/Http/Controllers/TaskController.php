<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = $request->user()->tasks();

        if($request->has('status')){
            $query->where('status',$request->status);
        }

        if($request->has('due_date')){
            $query->whereDate('due_date',$request->due_date);
        }

        try {

            $tasks = $query->latest()->paginate(5);

            return response()->json([
                'status' =>true,
                'data' => $tasks
            ],200);
        }catch(\Exception $e){
            Log::error('Task fetch error ',['message' => $e->getMessage()]);

            return response()->json([
                'status' => false,
                'message' => 'Internal server error : '.$e->getMessage()
            ], 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'due_date' => 'nullable|date',
        ]);

        try {
            $task = $request->user()->tasks()->create($validated);

            Log::info('Task created successfully ');

            return response()->json([
                'status' => true,
                'message' => 'Task created successfully',
                'data' => $task
            ],200);
        } catch(\Exception $e) {
            Log::error('Task creation error ',['message' => $e->getMessage()]);

            return response()->json([
                'status' => false,
                'message' => 'Internal Server Error : '.$e->getMessage()
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, $id)
    {
        try{
            $task = $request->user()->tasks()->find($id);
    
            if(!$task){
                return response()->json([
                    'status' => false,
                    'message' => 'Task not found'
                ],404);
            }
    
            return response()->json([
                'status' => true,
                'data' => $task
            ],200);
        } catch(\Exception $e) {
            Log::error('Error Occurred while fetching task ',['message' => $e->getMessage()]);

            return response()->json([
                'status' => false,
                'message' => 'Internal Server Error : '.$e->getMessage()
            ], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        if(empty($request->all())){
            return response()->json([
                'status' => false,
                'message' => 'Please provide valid data'
            ], 400);
        }
        
        try{
                        
            $task = $request->user()->tasks()->find($id);

            if(!$task){
                return response()->json([
                'status' => false,
                'message' => 'Task not found'
                ], 404);
            }
            $validated = $request->validate([
                'title' => 'sometimes|required|string|max:255',
                'description' => 'nullable|string',
                'status' => 'sometimes|in:pending,in-progress,completed',
                'due_date' => 'nullable|date',
            ]);

        
            $task->update($validated); 

            Log::info('Task Updated successfully ');

            return response()->json([
                'status' => true,
                'message' => 'Task updated successfully',
                'data' => $task
            ], 200);

        } catch (\Exception $e) {
            Log::error('Task Update Error', ['error' => $e->getMessage()]);

            return response()->json([
                'status' => false,
                'message' => 'Internal Server Error : '.$e->getMessage()
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, $id)
    {
        try {
            $task = $request->user()->tasks()->find($id);

            if(!$task){
                return response()->json([
                'status' => false,
                'message' => 'Task not found'
                ], 404);
            }

            $task->delete();

            Log::info('Task Deleted Successfully');

            return response()->json([
                'status' => true,
                'message' => 'Task deleted successfully'
            ], 200);

        } catch (\Exception $e) {
            Log::error('Task Delete Error', ['error' => $e->getMessage()]);

            return response()->json([
                'status' => false,
                'message' => 'Internal Server Error : '.$e->getMessage()
            ], 500);
        }
    }
}
