//
//  Constant.swift
//  TransactionHistory
//
//  Created by soc-admin on 8/20/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import Foundation
struct API_NAME {
    static let export_task_pdf = "customer/export_task_pdf"
    static let getAppCatalogue = "get_app_catalogue"
    static let fetchAppConfiguration = "fetch_app_configuration"
    static let checkEmailRegistered = "check_email_exists"
    static let signup = "vendor_signup"
    static let sendReferral = "apply_referral"
    static let loginEmail = "vendor_login"
    static let loginAccessToken = "vendor_login_via_access_token"
    static let forgotPass = "vendor_forgot_password"
    static let createTask = "create_task_via_vendor"//POST /change_vendor_password
    static let changePassword = "change_vendor_password"
    //POST /edit_vendor_profile
    static let editProfile = "edit_vendor_profile"
    static let getOrderHistory = "get_order_history"
    static let trackAgent = "track_agent"
    static let fetchCards = "fetch_merchant_cards"
    static let getPayment = "send_payment_for_task"
    static let getProductsForCategory = "get_products_for_category"
    static let getFavouriteLocation = "get_fav_location"
    static let deleteFavLocation = "delete_fav_location"
    static let addFavLocation = "add_fav_location"
    static let getAgents = "get_service_providers"
    static let editFavLocation = "edit_fav_location"
    static let assignPromo = "assign_coupon"
    static let getSuperCategories = "get_super_categories"
    static let submitTemplate = "submit_vendor_signup_template"
    //  static let uploadImageForReference = "upload_reference_images"
    static let makePendingPayment = "make_pending_payment"
    static let changeOpenTokStatus = "change_call_status"
    static let initiateOpenTokCall = "initiate_customer_to_fleet_call"
    static let generateOpenTokSessionId = "generate_customer_to_fleet_opentok_session"
    static let createSessionOpentok =  "create_session_opentok"
    static let stopRecordingVideoCall = "stop_recording_video_call"
    static let stopRecording = "stop_recording_video_call"
    static let recordVideoCall = "record_video_call"
    static let getCallLogData = "get_call_data"
    static let logout = "vendor_logout"
    static let customer_call_masking = "customer_call_masking"
    // static let documentUpload = "upload_docs"
    static let getCustomFieldsForTemplate = "get_custom_fields_for_template"
    static let createVendorRecurringTask = "create_vendor_recurring_task"
    static let viewVendorRecurringTasks = "view_vendor_recurring_tasks"
    static let deleteVendorRecurringRule = "delete_vendor_recurring_rule"
    static let addVendorRecurringExceptions = "add_vendor_recurring_exceptions"
    static let removeVendorRecurringExceptions = "remove_vendor_recurring_exceptions"
    static let googleMaps = "google_maps/get_data"
    static let get_customer_wallet = "get_customer_wallet"
    static let fetch_transactions = "fetch_transactions"
}

struct HTTP_METHOD {
    static let POST = "POST"
    static let GET = "GET"
    static let PUT = "PUT"
}

//MARK: STATUS CODE
struct STATUS_CODES {
    static let INVALID_ACCESS_TOKEN = 101
    static let BAD_REQUEST = 400
    static let UNAUTHORIZED_ACCESS = 401
    static let ERROR_IN_EXECUTION = 500
    static let SHOW_ERROR_MESSAGE = 304
    static let NOT_FOUND_MESSAGE = 404
    static let SHOW_MESSAGE = 201
    static let SHOW_DATA = 200
    static let SLOW_INTERNET_CONNECTION = 999
    static let DELETED_TASK = 501
}

//MARK:ERROR MESSAGE

//MARK: USER DEFAULT
struct USER_DEFAULT {
    static let selectedServer = "selectedServer"
    static let accessToken = "accessToken"
    static let selectedLocale = "locale"
    static let deviceToken = "deviceToken"
    static let voipDeviceToken = "voipDeviceToken"
    static let emailAddress = "emailAddress"
    static let phoneNumber = "phoneNumber"
    static let companyName = "companyName"
    static let address = "address"
    static let vendorName = "vendorName"
    static let vendorImage = "vendorImage"
    static let updatingLocationPathArray = "updatingPathLocationArray"
    static let isFirstTimeSignUp = "isFirstTimeSignUp"
    static let guestAccessToken = "guestAccessToken"
    static let isGuestLogin = "isGuestLogin"
    static let lastAccurateUserLocation = "lastUserLocation"
    static let jobPickUpLatForBill  = "jobPickupLatitude"
    static let jobPickupLongForBill  = "jobPickupLongitude"
    static let joblatForBill = "joblatForBill"
    static let joblongForBill = "joblongForBill"
}

