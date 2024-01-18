<?php

namespace App\Nova;

use Illuminate\Http\Request;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\File;
use Laravel\Nova\Fields\HasOne;
use Laravel\Nova\Fields\ID;
use Laravel\Nova\Http\Requests\NovaRequest;

class Document extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var class-string<\App\Models\Document>
     */
    public static $model = \App\Models\Document::class;

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'file';

    /**
     * The columns that should be searched.
     *
     * @var array
     */
    public static $search = [
        'id',
    ];

    /**
     * Get the fields displayed by the resource.
     *
     * @param  \Laravel\Nova\Http\Requests\NovaRequest  $request
     * @return array
     */
    public function fields(NovaRequest $request)
    {
        return [
            ID::make()->sortable(),
            File::make('File', 'file')
                ->disk('public')
                ->path('documents')
                ->creationRules('required')
                ->updateRules(function (NovaRequest $request) {
                    $model = $request->findModelOrFail();

                    return $model->file ? [] : ['required'];
                })
                ->acceptedTypes('.pdf,.doc,.docx')
                ->prunable(),
            BelongsTo::make('User')
                // how to get resource ID according to https://nova.laravel.com/docs/resources/fields.html#accessing-request-resource-ids
//                ->dependsOn('requirement', function($field, $request, $formData) {
//                    $requirementId =  (int) $formData->resource(Requirement::uriKey(), $formData->requirement);
//                    dd($requirementId); // always zero. The ajax request for the creation fields is not passing pack parent information.
//                })
                // how to get the ID based on https://nova.laravel.com/docs/resources/relationships.html#relatable-query-filtering
                ->dependsOn('requirement', function ($field, $request, $formData) {
                    // dd($formData); // has a requirement attribute, but...
                    dd($formData->requirement); // it's always null
                })  ,
            HasOne::make('Requirement', 'requirement', Requirement::class)->nullable(),
        ];
    }

    /**
     * Get the cards available for the request.
     *
     * @param  \Laravel\Nova\Http\Requests\NovaRequest  $request
     * @return array
     */
    public function cards(NovaRequest $request)
    {
        return [];
    }

    /**
     * Get the filters available for the resource.
     *
     * @param  \Laravel\Nova\Http\Requests\NovaRequest  $request
     * @return array
     */
    public function filters(NovaRequest $request)
    {
        return [];
    }

    /**
     * Get the lenses available for the resource.
     *
     * @param  \Laravel\Nova\Http\Requests\NovaRequest  $request
     * @return array
     */
    public function lenses(NovaRequest $request)
    {
        return [];
    }

    /**
     * Get the actions available for the resource.
     *
     * @param  \Laravel\Nova\Http\Requests\NovaRequest  $request
     * @return array
     */
    public function actions(NovaRequest $request)
    {
        return [];
    }
}
