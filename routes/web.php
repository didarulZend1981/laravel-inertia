<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductNameController;
use App\Http\Controllers\SaleController;
use App\Http\Controllers\SuplayerController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\SessionAuthenticate;
use App\Http\Middleware\TokenVerificationMiddleware;
use App\Models\Customer;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

// Route::get('/', function () {
//     return view('welcome');
// });


Route::get('/', function () {
    return Inertia::render('Home');
});

Route::get('/test1', function () {
    return Inertia::render('test1');
});

// Route::get('/',[HomeController::class,'index'])->name('home');
Route::get('/test',[HomeController::class,'test'])->name('test');
Route::post('/user-registration', [UserController::class, 'userRegistration'])->name('userRegistration');
Route::post('/user-login', [UserController::class, 'userLogin'])->name('userLogin');
Route::post('/send-otp', [UserController::class, 'SendOTPCode'])->name('SendOTPCode');
Route::post('/verify-otp', [UserController::class, 'VerifyOTP'])->name('VerifyOTP');

Route::middleware(SessionAuthenticate::class)->group(function(){

    // এখন TokenVerificationMiddleware এর পরিবর্তে SessionAuthenticate হবে কারণ এখন সেশন দিয়ে চেক করতে হবে



        Route::post('/reset-password', [UserController::class, 'ResetPassword']);
        Route::get('/DashboardPage', [UserController::class, 'DashboardPage']);
        Route::get('/user-logout', [UserController::class, 'UserLogout']);



        //Category all routes
        Route::post('/create-category', [CategoryController::class, 'CreateCategory'])->name('CategoryCreate');
        Route::get('/list-category', [CategoryController::class, 'CategoryList'])->name('CategoryList');
        Route::post('/category-by-id', [CategoryController::class, 'CategoryById'])->name('CategoryById');
        Route::post('/update-category', [CategoryController::class, 'CategoryUpdate'])->name('CategoryUpdate');
        Route::get('/delete-category/{id}', [CategoryController::class, 'CategoryDelete'])->name('CategoryDdelete');
        Route::get('/CategoryPage', [CategoryController::class, 'CategoryPage'])->name('CategoryPage');
        Route::get('/CategorySavePage', [CategoryController::class, 'CategorySavePage'])->name('CategorySavePage');


        //Suplayer--

            Route::get('/SuplayerPage', [SuplayerController::class, 'SuplayerPage'])->name('SuplayerPage');
            Route::post('/create-suplayer', [SuplayerController::class, 'SuplayerCreate'])->name('SuplayerCreate');
            Route::get('/delete-Suplayer/{id}', [SuplayerController::class, 'SuplayerDelete'])->name('SuplayerDelete');
            Route::post('/SuplayerSavePage', [SuplayerController::class, 'SuplayerSavePage'])->name('SuplayerSavePage');
            Route::post('/SuplayerSaveEdit', [SuplayerController::class, 'edit'])->name('SuplayerSaveEdit');
            Route::post('/update-Suplayer', [SuplayerController::class, 'SuplayerUpdate'])->name('SuplayerUpdate');

        //end

        //produc Name all routes
        Route::post('/create-productName', [ProductNameController::class, 'CreateProductName'])->name('CreateProductName');
        Route::get('/delete-productName/{id}', [ProductNameController::class, 'ProductNamePageDelete'])->name('ProductNamePageDelete');
        Route::get('/ProductNamePage', [ProductNameController::class, 'ProductNamePage'])->name('ProductNamePage');
        Route::post('/ProductNameSavePage', [ProductNameController::class, 'ProductNameSavePage'])->name('ProductNameSavePage');
        Route::post('/ProductNameSaveEdit', [ProductNameController::class, 'edit'])->name('ProductNameSaveEdit');
        Route::post('/update-ProductName', [ProductNameController::class, 'ProductNameUpdate'])->name('ProductNameUpdate');



        //produc all routes
        Route::post('/create-product', [ProductController::class, 'CreateProduct'])->name('CreateProduct');
        Route::get('/list-product', [ProductController::class, 'ProductList'])->name('ProductList');
        Route::post('/product-by-id', [ProductController::class, 'ProductById'])->name('ProductById');
        Route::post('/update-product', [ProductController::class, 'ProductUpdate'])->name('ProductUpdate');
        Route::get('/delete-product/{id}', [ProductController::class, 'ProductDelete'])->name('ProductDelete');
        // product page
        Route::get('/ProductPage', [ProductController::class, 'ProductPage'])->name('product.page');
        Route::get('/ProductSavePage', [ProductController::class, 'ProductSavePage'])->name('ProductSavePage');

        //Customer all routes
        Route::post('/create-customer', [CustomerController::class, 'CreateCustomer'])->name('CreateCustomer');
        Route::get('/list-customer', [CustomerController::class, 'CustomerList'])->name('CustomerList');
        Route::post('/customer-by-id', [CustomerController::class, 'CustomerById'])->name('CustomerById');
        Route::post('/update-customer', [CustomerController::class, 'CustomerUpdate'])->name('CustomerUpdate');
        Route::get('/delete-customer/{id}', [CustomerController::class, 'CustomerDelete'])->name('CustomerDelete');

        Route::get('/CustomerPage', [CustomerController::class, 'CustomerPage'])->name('CustomerPage');
        Route::get('/CustomerSavePage', [CustomerController::class, 'CustomerSavePage'])->name('CustomerSavePage');


        //Invoice all routes
        Route::post('/invoice-create', [InvoiceController::class, 'InvoiceCreate'])->name('InvoiceCreate');
        Route::get('/invoice-list', [InvoiceController::class, 'InvoiceList'])->name('InvoiceList');
        Route::post('/invoice-details', [InvoiceController::class, 'InvoiceDetails'])->name('InvoiceDetails');
        Route::get('/invoice-delete/{id}', [InvoiceController::class, 'InvoiceDelete'])->name('InvoiceDelete');


        //
        Route::get('/InvoiceListPage', [InvoiceController::class, 'InvoiceListPage'])->name('InvoiceListPage');


        //
         //sale route
         Route::get('/create-sale', [SaleController::class, 'SalePage'])->name('SalePage');

        //dashbord
        Route::get('/dashboard-summary', [DashboardController::class, 'DashboardSummary'])->name('DashboardSummary');
        Route::get('/reset-password',[UserController::class, 'ResetPasswordPage']);


        Route::get('/ProfilePage', [UserController::class, 'ProfilePage']);
        Route::post('/user-update', [UserController::class, 'UserUpdate']);
});


Route::middleware(SessionAuthenticate::class)->group(function(){
      Route::post('/update-Suplayer', [SuplayerController::class, 'SuplayerUpdate'])->name('SuplayerUpdate');
});

//Pages all routes
Route::get('/login',[UserController::class, 'LoginPage'])->name('login.page');
Route::get('/registration',[UserController::class, 'RegistrationPage'])->name('registration.page');
Route::get('/send-otp',[UserController::class, 'SendOTPPage'])->name('sendotp.page');
Route::get('/verify-otp',[UserController::class, 'VerifyOTPPage'])->name('VerifyOTPPage');

// Route::get('/login', function () {
//     return Inertia::render('LoginPage');
// });


