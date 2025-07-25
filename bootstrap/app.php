<?php

use App\Http\Middleware\HandleInertiaRequests;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
                 $middleware->web(append: [
                    HandleInertiaRequests::class,
                ]);
                $middleware->validateCsrfTokens(except: [
                    '*', // all
                    // 'http://example.com/foo/bar',
                    // 'http://example.com/foo/*',
                ]);


    })

    // ->withMiddleware(function (Middleware $middleware) {
    //             $middleware->validateCsrfTokens(except: [
    //                 '*', // all
    //                 'http://example.com/foo/bar',
    //                 'http://example.com/foo/*',
    //             ]);
    //     })

    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
