<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Coffee AEBro</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"/>
    <meta name="description" content="This is an example dashboard created using build-in elements and components.">

    <meta name="msapplication-tap-highlight" content="no">
    <link href="../css/main.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <%--    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>--%>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            min-width: 1000px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            min-width: 100%;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn-group {
            float: right;
        }

        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
            outline: none !important;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }

        /* Custom checkbox */
        .custom-checkbox {
            position: relative;
        }

        .custom-checkbox input[type="checkbox"] {
            opacity: 0;
            position: absolute;
            margin: 5px 0 0 3px;
            z-index: 9;
        }

        .custom-checkbox label:before {
            width: 18px;
            height: 18px;
        }

        .custom-checkbox label:before {
            content: '';
            margin-right: 10px;
            display: inline-block;
            vertical-align: text-top;
            background: white;
            border: 1px solid #bbb;
            border-radius: 2px;
            box-sizing: border-box;
            z-index: 2;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            content: '';
            position: absolute;
            left: 6px;
            top: 3px;
            width: 6px;
            height: 11px;
            border: solid #000;
            border-width: 0 3px 3px 0;
            transform: inherit;
            z-index: 3;
            transform: rotateZ(45deg);
        }

        .custom-checkbox input[type="checkbox"]:checked + label:before {
            border-color: #03A9F4;
            background: #03A9F4;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            border-color: #fff;
        }

        .custom-checkbox input[type="checkbox"]:disabled + label:before {
            color: #b8b8b8;
            cursor: auto;
            box-shadow: none;
            background: #ddd;
        }

        /* Modal styles */
        .modal .modal-dialog {
            max-width: 600px;
        }

        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
        }

        .modal .modal-content {
            border-radius: 3px;
            font-size: 14px;
        }

        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }

        .modal .modal-title {
            display: inline-block;
        }

        .modal .form-control {
            border-radius: 2px;
            box-shadow: none;
            border-color: #dddddd;
        }

        .modal textarea.form-control {
            resize: vertical;
        }

        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }

        .modal form label {
            font-weight: normal;
        }

        .form-select {
            display: block;
            width: 100%;
            padding: .375rem 2.25rem .375rem .75rem;
            -moz-padding-start: calc(0.75rem - 3px);
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-color: #fff;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right .75rem center;
            background-size: 16px 12px;
            border: 1px solid #ced4da;
            border-radius: .375rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none
        }

        @media (prefers-reduced-motion: reduce) {
            .form-select {
                transition: none
            }
        }

        .form-select:focus {
            border-color: #86b7fe;
            outline: 0;
            box-shadow: 0 0 0 .25rem rgba(13, 110, 253, .25)
        }

        .form-select[multiple], .form-select[size]:not([size="1"]) {
            padding-right: .75rem;
            background-image: none
        }

        .form-select:disabled {
            background-color: #e9ecef
        }

        .form-select:-moz-focusring {
            color: transparent;
            text-shadow: 0 0 0 #212529
        }

        .form-select-sm {
            padding-top: .25rem;
            padding-bottom: .25rem;
            padding-left: .5rem;
            font-size: .875rem;
            border-radius: .25rem
        }

        .form-select-lg {
            padding-top: .5rem;
            padding-bottom: .5rem;
            padding-left: 1rem;
            font-size: 1.25rem;
            border-radius: .5rem
        }

        .form-check {
            display: block;
            min-height: 1.5rem;
            padding-left: 1.5em;
            margin-bottom: .125rem
        }

        .form-check .form-check-input {
            float: left;
            margin-left: -1.5em
        }

        .form-check-reverse {
            padding-right: 1.5em;
            padding-left: 0;
            text-align: right
        }

        .form-check-reverse .form-check-input {
            float: right;
            margin-right: -1.5em;
            margin-left: 0
        }

        .form-check-input {
            width: 1em;
            height: 1em;
            margin-top: .25em;
            vertical-align: top;
            background-color: #fff;
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            border: 1px solid rgba(0, 0, 0, .25);
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            -webkit-print-color-adjust: exact;
            color-adjust: exact;
            print-color-adjust: exact
        }

        .form-check-input[type=checkbox] {
            border-radius: .25em
        }

        .form-check-input[type=radio] {
            border-radius: 50%
        }

        .form-check-input:active {
            filter: brightness(90%)
        }

        .form-check-input:focus {
            border-color: #86b7fe;
            outline: 0;
            box-shadow: 0 0 0 .25rem rgba(13, 110, 253, .25)
        }

        .form-check-input:checked {
            background-color: #0d6efd;
            border-color: #0d6efd
        }

        .form-check-input:checked[type=checkbox] {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3e%3cpath fill='none' stroke='%23fff' stroke-linecap='round' stroke-linejoin='round' stroke-width='3' d='m6 10 3 3 6-6'/%3e%3c/svg%3e")
        }

        .form-check-input:checked[type=radio] {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3e%3ccircle r='2' fill='%23fff'/%3e%3c/svg%3e")
        }

        .form-check-input[type=checkbox]:indeterminate {
            background-color: #0d6efd;
            border-color: #0d6efd;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3e%3cpath fill='none' stroke='%23fff' stroke-linecap='round' stroke-linejoin='round' stroke-width='3' d='M6 10h8'/%3e%3c/svg%3e")
        }

        .form-check-input:disabled {
            pointer-events: none;
            filter: none;
            opacity: .5
        }

        .form-check-input:disabled ~ .form-check-label, .form-check-input[disabled] ~ .form-check-label {
            cursor: default;
            opacity: .5
        }

        .form-switch {
            padding-left: 2.5em
        }

        .form-switch .form-check-input {
            width: 2em;
            margin-left: -2.5em;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3e%3ccircle r='3' fill='rgba%280, 0, 0, 0.25%29'/%3e%3c/svg%3e");
            background-position: left center;
            border-radius: 2em;
            transition: background-position .15s ease-in-out
        }

        @media (prefers-reduced-motion: reduce) {
            .form-switch .form-check-input {
                transition: none
            }
        }

        .form-switch .form-check-input:focus {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3e%3ccircle r='3' fill='%2386b7fe'/%3e%3c/svg%3e")
        }

        .form-switch .form-check-input:checked {
            background-position: right center;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3e%3ccircle r='3' fill='%23fff'/%3e%3c/svg%3e")
        }

        .form-switch.form-check-reverse {
            padding-right: 2.5em;
            padding-left: 0
        }

        .form-switch.form-check-reverse .form-check-input {
            margin-right: -2.5em;
            margin-left: 0
        }

        .form-check-inline {
            display: inline-block;
            margin-right: 1rem
        }

        .btn-check {
            position: absolute;
            clip: rect(0, 0, 0, 0);
            pointer-events: none
        }

        .btn-check:disabled + .btn, .btn-check[disabled] + .btn {
            pointer-events: none;
            filter: none;
            opacity: .65
        }

        .form-range {
            width: 100%;
            height: 1.5rem;
            padding: 0;
            background-color: transparent;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none
        }

        .form-range:focus {
            outline: 0
        }

        .form-range:focus::-webkit-slider-thumb {
            box-shadow: 0 0 0 1px #fff, 0 0 0 .25rem rgba(13, 110, 253, .25)
        }

        .form-range:focus::-moz-range-thumb {
            box-shadow: 0 0 0 1px #fff, 0 0 0 .25rem rgba(13, 110, 253, .25)
        }

        .form-range::-moz-focus-outer {
            border: 0
        }

        .form-range::-webkit-slider-thumb {
            width: 1rem;
            height: 1rem;
            margin-top: -.25rem;
            background-color: #0d6efd;
            border: 0;
            border-radius: 1rem;
            -webkit-transition: background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            transition: background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            -webkit-appearance: none;
            appearance: none
        }

        @media (prefers-reduced-motion: reduce) {
            .form-range::-webkit-slider-thumb {
                -webkit-transition: none;
                transition: none
            }
        }

        .form-range::-webkit-slider-thumb:active {
            background-color: #b6d4fe
        }

        .form-range::-webkit-slider-runnable-track {
            width: 100%;
            height: .5rem;
            color: transparent;
            cursor: pointer;
            background-color: #dee2e6;
            border-color: transparent;
            border-radius: 1rem
        }

        .form-range::-moz-range-thumb {
            width: 1rem;
            height: 1rem;
            background-color: #0d6efd;
            border: 0;
            border-radius: 1rem;
            -moz-transition: background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            transition: background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            -moz-appearance: none;
            appearance: none
        }

        @media (prefers-reduced-motion: reduce) {
            .form-range::-moz-range-thumb {
                -moz-transition: none;
                transition: none
            }
        }

        .form-range::-moz-range-thumb:active {
            background-color: #b6d4fe
        }

        .form-range::-moz-range-track {
            width: 100%;
            height: .5rem;
            color: transparent;
            cursor: pointer;
            background-color: #dee2e6;
            border-color: transparent;
            border-radius: 1rem
        }

        .form-range:disabled {
            pointer-events: none
        }

        .form-range:disabled::-webkit-slider-thumb {
            background-color: #adb5bd
        }

        .form-range:disabled::-moz-range-thumb {
            background-color: #adb5bd
        }

        .form-floating {
            position: relative
        }

        .form-floating > .form-control, .form-floating > .form-control-plaintext, .form-floating > .form-select {
            height: calc(3.5rem + 2px);
            line-height: 1.25
        }

        .form-floating > label {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            padding: 1rem .75rem;
            pointer-events: none;
            border: 1px solid transparent;
            transform-origin: 0 0;
            transition: opacity .1s ease-in-out, transform .1s ease-in-out
        }

        @media (prefers-reduced-motion: reduce) {
            .form-floating > label {
                transition: none
            }
        }

        .form-floating > .form-control, .form-floating > .form-control-plaintext {
            padding: 1rem .75rem
        }

        .form-floating > .form-control-plaintext::-moz-placeholder, .form-floating > .form-control::-moz-placeholder {
            color: transparent
        }

        .form-floating > .form-control-plaintext::placeholder, .form-floating > .form-control::placeholder {
            color: transparent
        }

        .form-floating > .form-control-plaintext:not(:-moz-placeholder-shown), .form-floating > .form-control:not(:-moz-placeholder-shown) {
            padding-top: 1.625rem;
            padding-bottom: .625rem
        }

        .form-floating > .form-control-plaintext:focus, .form-floating > .form-control-plaintext:not(:placeholder-shown), .form-floating > .form-control:focus, .form-floating > .form-control:not(:placeholder-shown) {
            padding-top: 1.625rem;
            padding-bottom: .625rem
        }

        .form-floating > .form-control-plaintext:-webkit-autofill, .form-floating > .form-control:-webkit-autofill {
            padding-top: 1.625rem;
            padding-bottom: .625rem
        }

        .form-floating > .form-select {
            padding-top: 1.625rem;
            padding-bottom: .625rem
        }

        .form-floating > .form-control:not(:-moz-placeholder-shown) ~ label {
            opacity: .65;
            transform: scale(.85) translateY(-.5rem) translateX(.15rem)
        }

        .form-floating > .form-control-plaintext ~ label, .form-floating > .form-control:focus ~ label, .form-floating > .form-control:not(:placeholder-shown) ~ label, .form-floating > .form-select ~ label {
            opacity: .65;
            transform: scale(.85) translateY(-.5rem) translateX(.15rem)
        }

        .form-floating > .form-control:-webkit-autofill ~ label {
            opacity: .65;
            transform: scale(.85) translateY(-.5rem) translateX(.15rem)
        }

        .form-floating > .form-control-plaintext ~ label {
            border-width: 1px 0
        }

        .input-group {
            position: relative;
            display: flex;
            flex-wrap: wrap;
            align-items: stretch;
            width: 100%
        }

        .input-group > .form-control, .input-group > .form-select {
            position: relative;
            flex: 1 1 auto;
            width: 1%;
            min-width: 0
        }

        .input-group > .form-control:focus, .input-group > .form-select:focus {
            z-index: 3
        }

        .input-group .btn {
            position: relative;
            z-index: 2
        }

        .input-group .btn:focus {
            z-index: 3
        }

        .input-group-text {
            display: flex;
            align-items: center;
            padding: .375rem .75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            text-align: center;
            white-space: nowrap;
            background-color: #e9ecef;
            border: 1px solid #ced4da;
            border-radius: .375rem
        }

        .input-group-lg > .btn, .input-group-lg > .form-control, .input-group-lg > .form-select, .input-group-lg > .input-group-text {
            padding: .5rem 1rem;
            font-size: 1.25rem;
            border-radius: .5rem
        }

        .input-group-sm > .btn, .input-group-sm > .form-control, .input-group-sm > .form-select, .input-group-sm > .input-group-text {
            padding: .25rem .5rem;
            font-size: .875rem;
            border-radius: .25rem
        }

        .input-group-lg > .form-select, .input-group-sm > .form-select {
            padding-right: 3rem
        }

        .input-group:not(.has-validation) > .dropdown-toggle:nth-last-child(n+3), .input-group:not(.has-validation) > :not(:last-child):not(.dropdown-toggle):not(.dropdown-menu) {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0
        }

        .input-group.has-validation > .dropdown-toggle:nth-last-child(n+4), .input-group.has-validation > :nth-last-child(n+3):not(.dropdown-toggle):not(.dropdown-menu) {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0
        }

        .input-group > :not(:first-child):not(.dropdown-menu):not(.valid-tooltip):not(.valid-feedback):not(.invalid-tooltip):not(.invalid-feedback) {
            margin-left: -1px;
            border-top-left-radius: 0;
            border-bottom-left-radius: 0
        }

        .valid-feedback {
            display: none;
            width: 100%;
            margin-top: .25rem;
            font-size: .875em;
            color: #198754
        }

        .valid-tooltip {
            position: absolute;
            top: 100%;
            z-index: 5;
            display: none;
            max-width: 100%;
            padding: .25rem .5rem;
            margin-top: .1rem;
            font-size: .875rem;
            color: #fff;
            background-color: rgba(25, 135, 84, .9);
            border-radius: .375rem
        }

        .is-valid ~ .valid-feedback, .is-valid ~ .valid-tooltip, .was-validated :valid ~ .valid-feedback, .was-validated :valid ~ .valid-tooltip {
            display: block
        }

        .form-control.is-valid, .was-validated .form-control:valid {
            border-color: #198754;
            padding-right: calc(1.5em + .75rem);
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='M2.3 6.73.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right calc(.375em + .1875rem) center;
            background-size: calc(.75em + .375rem) calc(.75em + .375rem)
        }

        .form-control.is-valid:focus, .was-validated .form-control:valid:focus {
            border-color: #198754;
            box-shadow: 0 0 0 .25rem rgba(25, 135, 84, .25)
        }

        .was-validated textarea.form-control:valid, textarea.form-control.is-valid {
            padding-right: calc(1.5em + .75rem);
            background-position: top calc(.375em + .1875rem) right calc(.375em + .1875rem)
        }

        .form-select.is-valid, .was-validated .form-select:valid {
            border-color: #198754
        }

        .form-select.is-valid:not([multiple]):not([size]), .form-select.is-valid:not([multiple])[size="1"], .was-validated .form-select:valid:not([multiple]):not([size]), .was-validated .form-select:valid:not([multiple])[size="1"] {
            padding-right: 4.125rem;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e"), url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='M2.3 6.73.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
            background-position: right .75rem center, center right 2.25rem;
            background-size: 16px 12px, calc(.75em + .375rem) calc(.75em + .375rem)
        }

        .form-select.is-valid:focus, .was-validated .form-select:valid:focus {
            border-color: #198754;
            box-shadow: 0 0 0 .25rem rgba(25, 135, 84, .25)
        }

        .form-control-color.is-valid, .was-validated .form-control-color:valid {
            width: calc(3rem + calc(1.5em + .75rem))
        }

        .form-check-input.is-valid, .was-validated .form-check-input:valid {
            border-color: #198754
        }

        .form-check-input.is-valid:checked, .was-validated .form-check-input:valid:checked {
            background-color: #198754
        }

        .form-check-input.is-valid:focus, .was-validated .form-check-input:valid:focus {
            box-shadow: 0 0 0 .25rem rgba(25, 135, 84, .25)
        }

        .form-check-input.is-valid ~ .form-check-label, .was-validated .form-check-input:valid ~ .form-check-label {
            color: #198754
        }

        .form-check-inline .form-check-input ~ .valid-feedback {
            margin-left: .5em
        }

        .input-group .form-control.is-valid, .input-group .form-select.is-valid, .was-validated .input-group .form-control:valid, .was-validated .input-group .form-select:valid {
            z-index: 1
        }

        .input-group .form-control.is-valid:focus, .input-group .form-select.is-valid:focus, .was-validated .input-group .form-control:valid:focus, .was-validated .input-group .form-select:valid:focus {
            z-index: 3
        }

        .invalid-feedback {
            display: none;
            width: 100%;
            margin-top: .25rem;
            font-size: .875em;
            color: #dc3545
        }

        .invalid-tooltip {
            position: absolute;
            top: 100%;
            z-index: 5;
            display: none;
            max-width: 100%;
            padding: .25rem .5rem;
            margin-top: .1rem;
            font-size: .875rem;
            color: #fff;
            background-color: rgba(220, 53, 69, .9);
            border-radius: .375rem
        }

        .is-invalid ~ .invalid-feedback, .is-invalid ~ .invalid-tooltip, .was-validated :invalid ~ .invalid-feedback, .was-validated :invalid ~ .invalid-tooltip {
            display: block
        }

        .form-control.is-invalid, .was-validated .form-control:invalid {
            border-color: #dc3545;
            padding-right: calc(1.5em + .75rem);
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right calc(.375em + .1875rem) center;
            background-size: calc(.75em + .375rem) calc(.75em + .375rem)
        }

        .form-control.is-invalid:focus, .was-validated .form-control:invalid:focus {
            border-color: #dc3545;
            box-shadow: 0 0 0 .25rem rgba(220, 53, 69, .25)
        }

        .was-validated textarea.form-control:invalid, textarea.form-control.is-invalid {
            padding-right: calc(1.5em + .75rem);
            background-position: top calc(.375em + .1875rem) right calc(.375em + .1875rem)
        }

        .form-select.is-invalid, .was-validated .form-select:invalid {
            border-color: #dc3545
        }

        .form-select.is-invalid:not([multiple]):not([size]), .form-select.is-invalid:not([multiple])[size="1"], .was-validated .form-select:invalid:not([multiple]):not([size]), .was-validated .form-select:invalid:not([multiple])[size="1"] {
            padding-right: 4.125rem;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e"), url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
            background-position: right .75rem center, center right 2.25rem;
            background-size: 16px 12px, calc(.75em + .375rem) calc(.75em + .375rem)
        }

        .form-select.is-invalid:focus, .was-validated .form-select:invalid:focus {
            border-color: #dc3545;
            box-shadow: 0 0 0 .25rem rgba(220, 53, 69, .25)
        }

        .form-control-color.is-invalid, .was-validated .form-control-color:invalid {
            width: calc(3rem + calc(1.5em + .75rem))
        }

        .form-check-input.is-invalid, .was-validated .form-check-input:invalid {
            border-color: #dc3545
        }

        .form-check-input.is-invalid:checked, .was-validated .form-check-input:invalid:checked {
            background-color: #dc3545
        }

        .form-check-input.is-invalid:focus, .was-validated .form-check-input:invalid:focus {
            box-shadow: 0 0 0 .25rem rgba(220, 53, 69, .25)
        }

        .form-check-input.is-invalid ~ .form-check-label, .was-validated .form-check-input:invalid ~ .form-check-label {
            color: #dc3545
        }

        .form-check-inline .form-check-input ~ .invalid-feedback {
            margin-left: .5em
        }

        .input-group .form-control.is-invalid, .input-group .form-select.is-invalid, .was-validated .input-group .form-control:invalid, .was-validated .input-group .form-select:invalid {
            z-index: 2
        }

        .input-group .form-control.is-invalid:focus, .input-group .form-select.is-invalid:focus, .was-validated .input-group .form-control:invalid:focus, .was-validated .input-group .form-select:invalid:focus {
            z-index: 3
        }
    </style>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font: 16px Arial;
        }

        .autocomplete {
            /*the container must be positioned relative:*/
            position: relative;
            display: inline-block;
            width: 100%;
        }

        input {
            border: 1px solid transparent;
            background-color: #f1f1f1;
            padding: 10px;
            font-size: 16px;
        }

        input[type=text] {
            background-color: #f1f1f1;
            width: 100%;
        }

        input[type=submit] {
            background-color: DodgerBlue;
            color: #fff;
        }

        .autocomplete-items {
            position: absolute;
            border: 1px solid #d4d4d4;
            border-bottom: none;
            border-top: none;
            z-index: 99;
            /*position the autocomplete items to be the same width as the container:*/
            top: 100%;
            left: 0;
            right: 0;
        }

        .autocomplete-items div {
            padding: 10px;
            cursor: pointer;
            background-color: #fff;
            border-bottom: 1px solid #d4d4d4;
        }

        .autocomplete-items div:hover {
            /*when hovering an item:*/
            background-color: #e9e9e9;
        }

        .autocomplete-active {
            /*when navigating through the items using the arrow keys:*/
            background-color: DodgerBlue !important;
            color: #ffffff;
        }
    </style>
    <script>
        $(document).ready(function () {
            // Activate tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function () {
                if (this.checked) {
                    checkbox.each(function () {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function () {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function () {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    </script>
</head>
<body>

<!-- Edit Modal HTML -->
<c:if test="${active==1}">
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add User</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                        <%--@elvariable id="user" type="lombok"--%>
                    <form:form action="/user/add" method="post" modelAttribute="user">
                    <div class="form-group mt-4">
                        <form:label path="name">Name</form:label>
                        <form:input name="name" path="name" class="form-control"/>

                        <form:label path="email">Email</form:label>
                        <form:input name="email" path="email" class="form-control"/>

                        <form:label path="password">Password</form:label>
                        <form:input name="password" path="password" class="form-control"/>

                        <form:label path="phone">Phone</form:label>
                        <form:input name="phone" path="phone" class="form-control"/>

                        <form:label path="birthday">Birthday</form:label>
                        <form:input path="birthday" name="birthday" type="date" class="form-control"/>
                        <div>
                            <form:label path="sex">Sex: </form:label>
                            <form:radiobutton path="sex" style="width: 5%" checked="checked" name="sex" value="0"/>
                            <label>Nam</label>
                            <form:radiobutton path="sex" style="width: 5%" name="sex" value="1"/>
                            <label>Nữ</label>
                        </div>
                        <form:label path="address">Address</form:label>
                        <form:input path="address" type="text" name="address" class="form-control"/>

                        <form:label path="image">Image</form:label>
                        <form:input name="image" type="file" path="image" class="form-control-file"/>

                        <br>
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <button class="btn btn-success mt-2">Create</button>
                        <button type="reset" class="btn btn-primary mt-2">Clear</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Delete Modal HTML -->
    <c:forEach items="${list.content}" var="pro" varStatus="status">
        <div id="deleteEmployeeModal${pro.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Delete Employee</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete these Records ${pro.name}?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <form action="/user/delete?id=${pro.id}" method="post">
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </form>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <!-- Delete All User Modal HTML -->
    <div id="deleteEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Delete User</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete these Records?</p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">

                    <button onclick="submitFormDeleteUser('deleteAll')" class="btn btn-danger">Xóa</button>

                    <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                </div>
            </div>
        </div>
    </div>
</c:if>
<c:if test="${active==2}">
    <!-- Add Area Modal HTML -->
    <div id="addAreaModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Area</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                    <%--@elvariable id="area" type="lombok"--%>
                <form:form action="/area/add" method="post" modelAttribute="area">
                    <div class="modal-body">
                        <div class="form-group mt-4">
                            <form:label class="card-title" path="name">Name</form:label>
                            <form:input name="name" path="name" class="form-control" value="${a.name}"/>

                            <form:label class="card-title pt-2" path="maxTable">Max Table</form:label>
                            <form:input name="maxTable" path="maxTable" class="form-control" value="${a.maxTable}"/>

                            <form:label class="card-title pt-2" path="amount">Amount Table</form:label>
                            <form:input name="amount" type="number" path="amount" class="form-control"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success">Create</button>
                        <button type="reset" class="btn btn-primary">Clear</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <!-- Delete Modal HTML -->
    <c:forEach items="${list.content}" var="a" varStatus="status">
        <div id="deleteAreaModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Delete Area</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete these Records ${a.name}?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <form action="/area/delete?id=${a.id}" method="post">
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </form>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <!-- Delete All User Modal HTML -->
    <div id="deleteAreaModalAll" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Delete Area</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete these Records?</p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">

                    <button onclick="submitFormDeleteUser('deleteAll')" class="btn btn-danger">Xóa</button>

                    <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                </div>
            </div>
        </div>
    </div>
    <c:forEach items="${list.content}" var="a" varStatus="status">
        <div id="updateAreaModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Area</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                        <%--@elvariable id="area" type="lombok"--%>
                    <form:form action="/area/update?id=${a.id}" method="post" modelAttribute="area">
                        <div class="modal-body">
                            <div class="form-group mt-4">
                                <form:label class="card-title" path="name">Name</form:label>
                                <form:input name="name" path="name" class="form-control" value="${a.name}"/>

                                <form:label class="card-title pt-2" path="maxTable">Max Table</form:label>
                                <form:input name="maxTable" path="maxTable" class="form-control" value="${a.maxTable}"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success">Update</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </c:forEach>
    <!-- Restore Area Modal HTML -->
    <c:forEach items="${list.content}" var="a" varStatus="status">
        <div id="restoreAreaModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Restore Area</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                        <%--@elvariable id="area" type="lombok"--%>
                    <form:form action="/area/restore?id=${a.id}" method="post" modelAttribute="area">
                        <div class="modal-body">
                            <div class="form-group mt-4">
                                <p>Are you sure you want to restore these Records?</p>
                                <p class="text-warning"><small>This action cannot be undone.</small></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success">Update</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </c:forEach>

</c:if>
<c:if test="${active==5}">
    <!-- Add Area Modal HTML -->
    <div id="addTableModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Table</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                    <%--@elvariable id="table" type="lombok"--%>
                <form:form action="/table/add" method="post" modelAttribute="table">
                    <div class="modal-body">
                        <div class="form-group mt-4">
                            <form:label class="card-title" path="location">Location</form:label>
                            <form:input name="location" path="location" class="form-control" value="${a.location}"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success">Create</button>
                        <button type="reset" class="btn btn-primary">Clear</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <!-- Delete Modal HTML -->
    <c:forEach items="${list.content}" var="a" varStatus="status">
        <div id="deleteTableModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Delete Table</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete these Records ${a.location}?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <form action="/table/delete?id=${a.id}" method="post">
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </form>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <!-- Delete All User Modal HTML -->
    <div id="deleteTableModalAll" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Delete Table</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete these Records?</p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">

                    <button onclick="submitFormDeleteUser('deleteAll')" class="btn btn-danger">Xóa</button>

                    <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                </div>
            </div>
        </div>
    </div>
    <c:forEach items="${list.content}" var="a" varStatus="status">
        <div id="updateTableModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Update Table</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                        <%--@elvariable id="table" type="lombok"--%>
                    <form:form action="/table/update?id=${a.id}" method="post" modelAttribute="table">
                        <div class="modal-body">
                            <div class="form-group mt-4">
                                <form:label class="card-title" path="location">Location</form:label>
                                <form:input name="location" path="location" class="form-control" value="${a.location}"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success">Update</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </c:forEach>
    <!-- Restore Table Modal HTML -->
    <c:forEach items="${list.content}" var="a" varStatus="status">
        <div id="restoreTableModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Restore Table</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                        <%--@elvariable id="area" type="lombok"--%>
                    <form:form action="/table/restore?id=${a.id}" method="post" modelAttribute="area">
                        <div class="modal-body">
                            <div class="form-group mt-4">
                                <p>Are you sure you want to restore these Records?</p>
                                <p class="text-warning"><small>This action cannot be undone.</small></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success">Update</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </c:forEach>

</c:if>
<c:if test="${active==3}">
    <!-- Add Water Modal HTML -->
    <div id="addWaterModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Water</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                    <%--@elvariable id="water" type="lombok"--%>
                <form:form action="/water/add" method="post" modelAttribute="water" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="form-group mt-4">
                            <form:label class="card-title" path="name">Name</form:label>
                            <form:input name="name" path="name" class="form-control" value="${w.name}"/>

                            <form:label class="card-title" path="price">Price</form:label>
                            <form:input name="price" path="price" class="form-control" value="${w.price}"/>

                            <label class="card-title">Size</label>
                            <div class="autocomplete">
                                <input class="form-control" type="text" name="nameSize" id="idSize" autocomplete="off" list="Size"/>
                                <datalist id="Size">
                                    <c:forEach var="o" items="${listSize1}">
                                    <option value="${o.nameSize}">
                                        </c:forEach>
                                </datalist>
                            </div>

                            <label class="card-title">Water Type</label>
                            <div class="autocomplete">
                                <input class="form-control" type="text" name="nameType" id="idType" list="citynames" autocomplete="off"/>
                                <datalist id="citynames">
                                    <c:forEach var="o" items="${listType1}">
                                    <option value="${o.nameType}">
                                        </c:forEach>
                                </datalist>
                            </div>
                            <form:label class="card-title pt-1" path="image">Image</form:label>
                            <input name="img" type="file" class="form-control-file"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success">Create</button>
                        <button type="reset" class="btn btn-primary">Clear</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <!-- Delete Modal HTML -->
    <c:forEach items="${list.content}" var="a" varStatus="status">
        <div id="deleteWaterModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Delete Table</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete these Records ${a.name}?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <form action="/water/delete?id=${a.id}" method="post">
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </form>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <!-- Delete All User Modal HTML -->
    <div id="deleteWaterModalAll" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Delete Water</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete these Records?</p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">

                    <button onclick="submitFormDeleteUser('deleteAll')" class="btn btn-danger">Xóa</button>

                    <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                </div>
            </div>
        </div>
    </div>
    <c:forEach items="${list.content}" var="w" varStatus="status">
        <div id="editWaterModal${w.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Update Water</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                        <%--@elvariable id="water" type="lombok"--%>
                    <form:form action="/water/update?id=${w.id}" method="post" modelAttribute="water" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-group mt-4">
                                <form:label class="card-title" path="name">Name</form:label>
                                <form:input name="name" path="name" class="form-control" value="${w.name}"/>

                                <form:label class="card-title" path="price">Price</form:label>
                                <form:input name="price" path="price" class="form-control" value="${w.price}"/>

                                <label class="card-title">Size</label>
                                <div class="autocomplete">
                                    <input class="form-control" type="text" name="nameSize" id="idSize" autocomplete="off" list="Size" value="${w.idSize.nameSize}"/>
                                    <datalist id="Size">
                                        <c:forEach var="o" items="${listSize1}">
                                        <option value="${o.nameSize}">
                                            </c:forEach>
                                    </datalist>
                                </div>

                                <label class="card-title">Water Type</label>
                                <div class="autocomplete">
                                    <input class="form-control" type="text" name="nameType" id="idType" list="citynames" autocomplete="off" value="${w.idType.nameType}"/>
                                    <datalist id="citynames">
                                        <c:forEach var="o" items="${listType1}">
                                        <option value="${o.nameType}">
                                            </c:forEach>
                                    </datalist>
                                </div>
                                <form:label class="card-title pt-1" path="image">Image</form:label>
                                <input name="img" type="file" class="form-control-file"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success">Update</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>
<c:if test="${active==4}">
    <!-- Add cart Modal HTML -->
    <c:forEach items="${listWater.content}" var="a" varStatus="status">
        <div id="addCartModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Water Bill</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Do you want to add ${a.idType.nameType} ${a.name} to the bill?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                            <a href="/order/cart?idWater=${a.id}" class="btn btn-primary">Add</a>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <!-- Delete Modal HTML -->
    <c:forEach items="${listWater.content}" var="a" varStatus="status">
        <div id="deleteOrderDetailModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Delete Cart</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete these Records ${a.idType.nameType} ${a.name}?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <form action="/order/delete?idWater=${a.id}" method="post">
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </form>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <!-- Delete All User Modal HTML -->
    <div id="deleteOrderModalAll" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Delete Bill</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <%--@elvariable id="orderd" type="lombok"--%>
                <form:form action="/order/delete?idWater=0" method="post" modelAttribute="orderd">
                <div class="modal-body">
                    <form:label class="card-title" path="reason">Lí do xóa</form:label>
                    <form:input name="name" path="reason" class="form-control"/>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Xóa</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                </div>
                </form:form>
            </div>
        </div>
    </div>
    <c:forEach items="${listOder}" var="c" varStatus="status">
        <c:forEach items="${c.getOrderDetailList()}" var="a" varStatus="status">
        <div id="cancellationOrderDetailModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cancellation Water : ${a.idWater.idType.nameType} ${a.idWater.name}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                        <%--@elvariable id="orderDetail" type="lombok"--%>
                    <form:form action="/order/cancellation?id=${a.id}" method="post" modelAttribute="orderDetail">
                        <div class="modal-body">
                            <div class="form-group mt-4">
                                <form:label class="card-title" path="reason">Reason</form:label>
                                <form:input name="reason" path="reason" class="form-control"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success">Confirm</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        </c:forEach>
    </c:forEach>
    <c:forEach items="${listOder}" var="a" varStatus="status">
        <div id="paymentOrderModal${a.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Payment bill MHD : ${a.id}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                        <%--@elvariable id="water" type="lombok"--%>
                    <form:form action="/order/update?id=${a.id}" method="post">
                        <div class="modal-body">
                            <div class="form-group mt-4">
                                <h2>Tổng tiền :${df.format(total)} VNĐ</h2>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success">Confirm</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:forEach items="${listHistory}" var="a" varStatus="status">
        <div id="historyOrderDetailModal${a.id}" class="modal">
            <div class="modal-body modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Detail bill MHD : ${a.id}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                        <div class="modal-body">
                            <div class="form-group mt-4">
                                <div class="table-responsive ">
                                    <table class="mb-0 table">
                                        <thead>
                                        <tr>
                                            <th style="width: 12%">Name Water</th>
                                            <th>Image</th>
                                            <th style="width: 2%">Size</th>
                                            <th style="width: 2%">Quantity</th>
                                            <th style="width: 30%">Note</th>
                                            <th style="width: 30%">Reason</th>
                                            <th style="width: 10%">Status</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="c" items="${a.getOrderDetailList()}">
                                            <tr>
                                                <td>${c.idWater.idType.nameType} ${c.idWater.name}</td>
                                                <td>
                                                    <img width="50" height="50" class="rounded-circle"
                                                         src="/getimage/${c.idWater.image}" alt="">
                                                </td>
                                                <td>${c.idWater.idSize.nameSize}</td>
                                                <td>${c.quantity}</td>
                                                <td>${c.note}</td>
                                                <td>${c.reason}</td>
                                                <td>${c.status==0?"Thành công":"Bị huỷ"}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Đóng</button>
                        </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:forEach var="table" items="${listTable}">
        <div id="moveTableModal${table.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Go to the ${table.idArea.name}  table: ${table.location}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                        <%--@elvariable id="water" type="lombok"--%>
                    <form:form action="/order/move?id=${table.id}" method="post">
                        <div class="modal-body">
                            <div class="form-group mt-4">
                                <p>You definitely want to move ${TableCu.idArea.name}  table: ${TableCu.location} to ${table.idArea.name}  table: ${table.location}</p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success">Confirm</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        <div id="mergetableModal${table.id}" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Table merge : ${table.idArea.name}  table: ${table.location}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                        <%--@elvariable id="water" type="lombok"--%>
                    <form:form action="/order/merge?id=${table.id}" method="post">
                        <div class="modal-body">
                            <div class="form-group mt-4">
                                <p>You want to combine ${TableCu.idArea.name}  table: ${TableCu.location} with ${table.idArea.name}  table: ${table.location}</p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success">Confirm</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Hủy</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>
<div class="app-container app-theme-white body-tabs-shadow fixed-header fixed-sidebar">
    <div class="app-header header-shadow">
        <div class="app-header__logo">
            <div class="logo-src"></div>
            <div class="header__pane ml-auto">
                <div>
                    <button type="button" class="hamburger close-sidebar-btn hamburger--elastic"
                            data-class="closed-sidebar">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                    </button>
                </div>
            </div>
        </div>
        <div class="app-header__mobile-menu">
            <div>
                <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                        <span class="hamburger-box">
                            <span class="hamburger-inner"></span>
                        </span>
                </button>
            </div>
        </div>
        <div class="app-header__menu">
                <span>
                    <button type="button"
                            class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                        <span class="btn-icon-wrapper">
                            <i class="fa fa-ellipsis-v fa-w-6"></i>
                        </span>
                    </button>
                </span>
        </div>
        <div class="app-header__content">
            <div class="app-header-left">
                <div class="search-wrapper">
                    <div class="input-holder">
                        <input type="text" class="search-input" placeholder="Type to search">
                        <button class="search-icon"><span></span></button>
                    </div>
                    <button class="close"></button>
                </div>
                <ul class="header-megamenu nav">
                    <li class="nav-item">
                        <a href="javascript:void(0);" data-placement="bottom" rel="popover-focus" data-offset="300"
                           data-toggle="popover-custom" class="nav-link">
                            <i class="nav-link-icon pe-7s-gift"> </i> Mega Menu
                            <i class="fa fa-angle-down ml-2 opacity-5"></i>
                        </a>
                        <div class="rm-max-width">
                            <div class="d-none popover-custom-content">
                                <div class="dropdown-mega-menu">
                                    <div class="grid-menu grid-menu-3col">
                                        <div class="no-gutters row">
                                            <div class="col-sm-6 col-xl-4">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item-header nav-item"> Overview</li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">
                                                            <i class="nav-link-icon lnr-inbox"></i>
                                                            <span> Contacts</span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">
                                                            <i class="nav-link-icon lnr-book"></i>
                                                            <span> Incidents</span>
                                                            <div class="ml-auto badge badge-pill badge-danger">5
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">
                                                            <i class="nav-link-icon lnr-picture"></i>
                                                            <span> Companies</span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a disabled="" href="javascript:void(0);"
                                                           class="nav-link disabled">
                                                            <i class="nav-link-icon lnr-file-empty"></i>
                                                            <span> Manage</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-6 col-xl-4">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item-header nav-item"> Favourites</li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link"> Reports
                                                            Conversions </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link"> Quick Start
                                                            <div class="ml-auto badge badge-success">New</div>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Users &amp;
                                                            Groups</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);"
                                                           class="nav-link">Proprieties</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-6 col-xl-4">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item-header nav-item">Sales &amp; Marketing</li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Queues </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Resource
                                                            Groups </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Goal Metrics
                                                            <div class="ml-auto badge badge-warning">3</div>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Campaigns</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="btn-group nav-item">
                        <a class="nav-link" data-toggle="dropdown" aria-expanded="false">
                            <span class="badge badge-pill badge-danger ml-0 mr-2">4</span> Settings
                            <i class="fa fa-angle-down ml-2 opacity-5"></i>
                        </a>
                        <div tabindex="-1" role="menu" aria-hidden="true" class="rm-pointers dropdown-menu">
                            <div class="dropdown-menu-header">
                                <div class="dropdown-menu-header-inner bg-secondary">
                                    <div class="menu-header-image opacity-5"
                                         style="background-image: url('../assets/images/dropdown-header/abstract2.jpg');">
                                    </div>
                                    <div class="menu-header-content">
                                        <h5 class="menu-header-title">Overview</h5>
                                        <h6 class="menu-header-subtitle">Dropdown menus for everyone</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="scroll-area-xs">
                                <div class="scrollbar-container">
                                    <h6 tabindex="-1" class="dropdown-header">Key Figures</h6>
                                    <button type="button" tabindex="0" class="dropdown-item">Service
                                        Calendar
                                    </button>
                                    <button type="button" tabindex="0" class="dropdown-item">Knowledge Base</button>
                                    <button type="button" tabindex="0" class="dropdown-item">Accounts</button>
                                    <div tabindex="-1" class="dropdown-divider"></div>
                                    <button type="button" tabindex="0" class="dropdown-item">Products</button>
                                    <button type="button" tabindex="0" class="dropdown-item">Rollup Queries</button>
                                </div>
                            </div>
                            <ul class="nav flex-column">
                                <li class="nav-item-divider nav-item"></li>
                                <li class="nav-item-btn nav-item">
                                    <button class="btn-wide btn-shadow btn btn-danger btn-sm">Cancel</button>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="dropdown nav-item">
                        <a aria-haspopup="true" data-toggle="dropdown" class="nav-link" aria-expanded="false">
                            <i class="nav-link-icon pe-7s-settings"></i> Projects
                            <i class="fa fa-angle-down ml-2 opacity-5"></i>
                        </a>
                        <div tabindex="-1" role="menu" aria-hidden="true"
                             class="dropdown-menu-rounded dropdown-menu-lg rm-pointers dropdown-menu">
                            <div class="dropdown-menu-header">
                                <div class="dropdown-menu-header-inner bg-success">
                                    <div class="menu-header-image opacity-1"
                                         style="background-image: url('../assets/images/dropdown-header/abstract3.jpg');">
                                    </div>
                                    <div class="menu-header-content text-left">
                                        <h5 class="menu-header-title">Overview</h5>
                                        <h6 class="menu-header-subtitle">Unlimited options</h6>
                                        <div class="menu-header-btn-pane">
                                            <button class="mr-2 btn btn-dark btn-sm">Settings</button>
                                            <button class="btn-icon btn-icon-only btn btn-warning btn-sm">
                                                <i class="pe-7s-config btn-icon-wrapper"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="button" tabindex="0" class="dropdown-item">
                                <i class="dropdown-icon lnr-file-empty"></i>Graphic Design
                            </button>
                            <button type="button" tabindex="0" class="dropdown-item">
                                <i class="dropdown-icon lnr-file-empty"> </i>App Development
                            </button>
                            <button type="button" tabindex="0" class="dropdown-item">
                                <i class="dropdown-icon lnr-file-empty"> </i>Icon Design
                            </button>
                            <div tabindex="-1" class="dropdown-divider"></div>
                            <button type="button" tabindex="0" class="dropdown-item">
                                <i class="dropdown-icon lnr-file-empty"></i>Miscellaneous
                            </button>
                            <button type="button" tabindex="0" class="dropdown-item">
                                <i class="dropdown-icon lnr-file-empty"></i>Frontend Dev
                            </button>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="app-header-right">
                <div class="header-dots">
                    <div class="dropdown">
                        <button type="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown"
                                class="p-0 mr-2 btn btn-link">
                                <span class="icon-wrapper icon-wrapper-alt rounded-circle">
                                    <span class="icon-wrapper-bg bg-primary"></span>
                                    <i class="icon text-primary ion-android-apps"></i>
                                </span>
                        </button>
                        <div tabindex="-1" role="menu" aria-hidden="true"
                             class="dropdown-menu-xl rm-pointers dropdown-menu dropdown-menu-right">
                            <div class="dropdown-menu-header">
                                <div class="dropdown-menu-header-inner bg-plum-plate">
                                    <div class="menu-header-image"
                                         style="background-image: url('../assets/images/dropdown-header/abstract4.jpg');">
                                    </div>
                                    <div class="menu-header-content text-white">
                                        <h5 class="menu-header-title">Grid Dashboard</h5>
                                        <h6 class="menu-header-subtitle">Easy grid navigation inside dropdowns</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="grid-menu grid-menu-xl grid-menu-3col">
                                <div class="no-gutters row">
                                    <div class="col-sm-6 col-xl-4">
                                        <button
                                                class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                                            <i
                                                    class="pe-7s-world icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3"></i>
                                            Automation
                                        </button>
                                    </div>
                                    <div class="col-sm-6 col-xl-4">
                                        <button
                                                class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                                            <i
                                                    class="pe-7s-piggy icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3">
                                            </i> Reports
                                        </button>
                                    </div>
                                    <div class="col-sm-6 col-xl-4">
                                        <button
                                                class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                                            <i
                                                    class="pe-7s-config icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3">
                                            </i> Settings
                                        </button>
                                    </div>
                                    <div class="col-sm-6 col-xl-4">
                                        <button
                                                class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                                            <i
                                                    class="pe-7s-browser icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3">
                                            </i> Content
                                        </button>
                                    </div>
                                    <div class="col-sm-6 col-xl-4">
                                        <button
                                                class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                                            <i
                                                    class="pe-7s-hourglass icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3"></i>
                                            Activity
                                        </button>
                                    </div>
                                    <div class="col-sm-6 col-xl-4">
                                        <button
                                                class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                                            <i
                                                    class="pe-7s-world icon-gradient bg-night-fade btn-icon-wrapper btn-icon-lg mb-3">
                                            </i> Contacts
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <ul class="nav flex-column">
                                <li class="nav-item-divider nav-item"></li>
                                <li class="nav-item-btn text-center nav-item">
                                    <button class="btn-shadow btn btn-primary btn-sm">Follow-ups</button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="dropdown">
                        <button type="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown"
                                class="p-0 mr-2 btn btn-link">
                                <span class="icon-wrapper icon-wrapper-alt rounded-circle">
                                    <span class="icon-wrapper-bg bg-danger"></span>
                                    <i class="icon text-danger icon-anim-pulse ion-android-notifications"></i>
                                    <span class="badge badge-dot badge-dot-sm badge-danger">Notifications</span>
                                </span>
                        </button>
                        <div tabindex="-1" role="menu" aria-hidden="true"
                             class="dropdown-menu-xl rm-pointers dropdown-menu dropdown-menu-right">
                            <div class="dropdown-menu-header mb-0">
                                <div class="dropdown-menu-header-inner bg-deep-blue">
                                    <div class="menu-header-image opacity-1"
                                         style="background-image: url('../assets/images/dropdown-header/city3.jpg');">
                                    </div>
                                    <div class="menu-header-content text-dark">
                                        <h5 class="menu-header-title">Notifications</h5>
                                        <h6 class="menu-header-subtitle">You have <b>21</b> unread messages</h6>
                                    </div>
                                </div>
                            </div>
                            <ul
                                    class="tabs-animated-shadow tabs-animated nav nav-justified tabs-shadow-bordered p-3">
                                <li class="nav-item">
                                    <a role="tab" class="nav-link active" data-toggle="tab"
                                       href="#tab-messages-header">
                                        <span>Messages</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a role="tab" class="nav-link" data-toggle="tab" href="#tab-events-header">
                                        <span>Events</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a role="tab" class="nav-link" data-toggle="tab" href="#tab-errors-header">
                                        <span>System Errors</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab-messages-header" role="tabpanel">
                                    <div class="scroll-area-sm">
                                        <div class="scrollbar-container">
                                            <div class="p-3">
                                                <div class="notifications-box">
                                                    <div
                                                            class="vertical-time-simple vertical-without-time vertical-timeline vertical-timeline--one-column">
                                                        <div
                                                                class="vertical-timeline-item dot-danger vertical-timeline-element">
                                                            <div><span
                                                                    class="vertical-timeline-element-icon bounce-in"></span>
                                                                <div
                                                                        class="vertical-timeline-element-content bounce-in">
                                                                    <h4 class="timeline-title">All Hands Meeting
                                                                    </h4>
                                                                    <span
                                                                            class="vertical-timeline-element-date"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="vertical-timeline-item dot-warning vertical-timeline-element">
                                                            <div>
                                                                    <span
                                                                            class="vertical-timeline-element-icon bounce-in"></span>
                                                                <div
                                                                        class="vertical-timeline-element-content bounce-in">
                                                                    <p>Yet another one, at <span
                                                                            class="text-success">15:00 PM</span></p>
                                                                    <span
                                                                            class="vertical-timeline-element-date"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="vertical-timeline-item dot-success vertical-timeline-element">
                                                            <div>
                                                                    <span
                                                                            class="vertical-timeline-element-icon bounce-in"></span>
                                                                <div
                                                                        class="vertical-timeline-element-content bounce-in">
                                                                    <h4 class="timeline-title">Build the production
                                                                        release
                                                                        <span
                                                                                class="badge badge-danger ml-2">NEW</span>
                                                                    </h4>
                                                                    <span
                                                                            class="vertical-timeline-element-date"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="vertical-timeline-item dot-primary vertical-timeline-element">
                                                            <div>
                                                                    <span
                                                                            class="vertical-timeline-element-icon bounce-in"></span>
                                                                <div
                                                                        class="vertical-timeline-element-content bounce-in">
                                                                    <h4 class="timeline-title">Something not
                                                                        important
                                                                        <div
                                                                                class="avatar-wrapper mt-2 avatar-wrapper-overlap">
                                                                            <div
                                                                                    class="avatar-icon-wrapper avatar-icon-sm">
                                                                                <div class="avatar-icon">
                                                                                    <img src="../assets/images/avatars/1.jpg"
                                                                                         alt="">
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                    class="avatar-icon-wrapper avatar-icon-sm">
                                                                                <div class="avatar-icon">
                                                                                    <img src="../assets/images/avatars/2.jpg"
                                                                                         alt="">
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                    class="avatar-icon-wrapper avatar-icon-sm">
                                                                                <div class="avatar-icon">
                                                                                    <img src="../assets/images/avatars/3.jpg"
                                                                                         alt="">
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                    class="avatar-icon-wrapper avatar-icon-sm">
                                                                                <div class="avatar-icon">
                                                                                    <img src="../assets/images/avatars/4.jpg"
                                                                                         alt="">
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                    class="avatar-icon-wrapper avatar-icon-sm">
                                                                                <div class="avatar-icon">
                                                                                    <img src="../assets/images/avatars/5.jpg"
                                                                                         alt="">
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                    class="avatar-icon-wrapper avatar-icon-sm">
                                                                                <div class="avatar-icon">
                                                                                    <img src="../assets/images/avatars/9.jpg"
                                                                                         alt="">
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                    class="avatar-icon-wrapper avatar-icon-sm">
                                                                                <div class="avatar-icon">
                                                                                    <img src="../assets/images/avatars/7.jpg"
                                                                                         alt="">
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                    class="avatar-icon-wrapper avatar-icon-sm">
                                                                                <div class="avatar-icon">
                                                                                    <img src="../assets/images/avatars/8.jpg"
                                                                                         alt="">
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                    class="avatar-icon-wrapper avatar-icon-sm avatar-icon-add">
                                                                                <div class="avatar-icon"><i>+</i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </h4>
                                                                    <span
                                                                            class="vertical-timeline-element-date"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="vertical-timeline-item dot-info vertical-timeline-element">
                                                            <div>
                                                                    <span
                                                                            class="vertical-timeline-element-icon bounce-in"></span>
                                                                <div
                                                                        class="vertical-timeline-element-content bounce-in">
                                                                    <h4 class="timeline-title">This dot has an info
                                                                        state</h4>
                                                                    <span
                                                                            class="vertical-timeline-element-date"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="vertical-timeline-item dot-danger vertical-timeline-element">
                                                            <div>
                                                                    <span
                                                                            class="vertical-timeline-element-icon bounce-in"></span>
                                                                <div
                                                                        class="vertical-timeline-element-content bounce-in">
                                                                    <h4 class="timeline-title">All Hands Meeting
                                                                    </h4>
                                                                    <span
                                                                            class="vertical-timeline-element-date"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="vertical-timeline-item dot-warning vertical-timeline-element">
                                                            <div>
                                                                    <span
                                                                            class="vertical-timeline-element-icon bounce-in"></span>
                                                                <div
                                                                        class="vertical-timeline-element-content bounce-in">
                                                                    <p>Yet another one, at <span
                                                                            class="text-success">15:00 PM</span>
                                                                    </p><span
                                                                        class="vertical-timeline-element-date"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="vertical-timeline-item dot-success vertical-timeline-element">
                                                            <div><span
                                                                    class="vertical-timeline-element-icon bounce-in"></span>
                                                                <div
                                                                        class="vertical-timeline-element-content bounce-in">
                                                                    <h4 class="timeline-title">Build the production
                                                                        release
                                                                        <span
                                                                                class="badge badge-danger ml-2">NEW</span>
                                                                    </h4>
                                                                    <span
                                                                            class="vertical-timeline-element-date"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                                class="vertical-timeline-item dot-dark vertical-timeline-element">
                                                            <div><span
                                                                    class="vertical-timeline-element-icon bounce-in"></span>
                                                                <div
                                                                        class="vertical-timeline-element-content bounce-in">
                                                                    <h4 class="timeline-title">This dot has a dark
                                                                        state</h4>
                                                                    <span
                                                                            class="vertical-timeline-element-date"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-events-header" role="tabpanel">
                                    <div class="scroll-area-sm">
                                        <div class="scrollbar-container">
                                            <div class="p-3">
                                                <div
                                                        class="vertical-without-time vertical-timeline vertical-timeline--animate vertical-timeline--one-column">
                                                    <div class="vertical-timeline-item vertical-timeline-element">
                                                        <div>
                                                                <span class="vertical-timeline-element-icon bounce-in">
                                                                    <i
                                                                            class="badge badge-dot badge-dot-xl badge-success">
                                                                    </i>
                                                                </span>
                                                            <div
                                                                    class="vertical-timeline-element-content bounce-in">
                                                                <h4 class="timeline-title">All Hands Meeting</h4>
                                                                <p>Lorem ipsum dolor sic amet, today at
                                                                    <a href="javascript:void(0);">12:00 PM</a>
                                                                </p>
                                                                <span class="vertical-timeline-element-date"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vertical-timeline-item vertical-timeline-element">
                                                        <div>
                                                                <span class="vertical-timeline-element-icon bounce-in">
                                                                    <i
                                                                            class="badge badge-dot badge-dot-xl badge-warning">
                                                                    </i>
                                                                </span>
                                                            <div
                                                                    class="vertical-timeline-element-content bounce-in">
                                                                <p>Another meeting today, at <b
                                                                        class="text-danger">12:00 PM</b></p>
                                                                <p>Yet another one, at <span
                                                                        class="text-success">15:00 PM</span></p>
                                                                <span class="vertical-timeline-element-date"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vertical-timeline-item vertical-timeline-element">
                                                        <div>
                                                                <span class="vertical-timeline-element-icon bounce-in">
                                                                    <i
                                                                            class="badge badge-dot badge-dot-xl badge-danger">
                                                                    </i>
                                                                </span>
                                                            <div
                                                                    class="vertical-timeline-element-content bounce-in">
                                                                <h4 class="timeline-title">Build the production
                                                                    release</h4>
                                                                <p>Lorem ipsum dolor sit amit,consectetur eiusmdd
                                                                    tempor incididunt ut
                                                                    labore et dolore magna elit enim at minim veniam
                                                                    quis nostrud
                                                                </p>
                                                                <span class="vertical-timeline-element-date"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vertical-timeline-item vertical-timeline-element">
                                                        <div>
                                                                <span class="vertical-timeline-element-icon bounce-in">
                                                                    <i
                                                                            class="badge badge-dot badge-dot-xl badge-primary">
                                                                    </i>
                                                                </span>
                                                            <div
                                                                    class="vertical-timeline-element-content bounce-in">
                                                                <h4 class="timeline-title text-success">Something
                                                                    not important</h4>
                                                                <p>Lorem ipsum dolor sit amit,consectetur elit enim
                                                                    at minim veniam quis nostrud</p>
                                                                <span class="vertical-timeline-element-date"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vertical-timeline-item vertical-timeline-element">
                                                        <div>
                                                                <span class="vertical-timeline-element-icon bounce-in">
                                                                    <i
                                                                            class="badge badge-dot badge-dot-xl badge-success">
                                                                    </i>
                                                                </span>
                                                            <div
                                                                    class="vertical-timeline-element-content bounce-in">
                                                                <h4 class="timeline-title">All Hands Meeting</h4>
                                                                <p>Lorem ipsum dolor sic amet, today at
                                                                    <a href="javascript:void(0);">12:00 PM</a>
                                                                </p>
                                                                <span class="vertical-timeline-element-date"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vertical-timeline-item vertical-timeline-element">
                                                        <div>
                                                                <span class="vertical-timeline-element-icon bounce-in">
                                                                    <i
                                                                            class="badge badge-dot badge-dot-xl badge-warning">
                                                                    </i>
                                                                </span>
                                                            <div
                                                                    class="vertical-timeline-element-content bounce-in">
                                                                <p>Another meeting today, at <b
                                                                        class="text-danger">12:00 PM</b></p>
                                                                <p>Yet another one, at <span
                                                                        class="text-success">15:00 PM</span></p>
                                                                <span class="vertical-timeline-element-date"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vertical-timeline-item vertical-timeline-element">
                                                        <div>
                                                                <span class="vertical-timeline-element-icon bounce-in">
                                                                    <i
                                                                            class="badge badge-dot badge-dot-xl badge-danger">
                                                                    </i>
                                                                </span>
                                                            <div
                                                                    class="vertical-timeline-element-content bounce-in">
                                                                <h4 class="timeline-title">Build the production
                                                                    release</h4>
                                                                <p>Lorem ipsum dolor sit amit,consectetur eiusmdd
                                                                    tempor incididunt ut
                                                                    labore et dolore magna elit enim at minim veniam
                                                                    quis nostrud
                                                                </p>
                                                                <span class="vertical-timeline-element-date"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vertical-timeline-item vertical-timeline-element">
                                                        <div>
                                                                <span class="vertical-timeline-element-icon bounce-in">
                                                                    <i
                                                                            class="badge badge-dot badge-dot-xl badge-primary">
                                                                    </i>
                                                                </span>
                                                            <div
                                                                    class="vertical-timeline-element-content bounce-in">
                                                                <h4 class="timeline-title text-success">Something
                                                                    not important</h4>
                                                                <p>Lorem ipsum dolor sit amit,consectetur elit enim
                                                                    at minim veniam quis nostrud</p>
                                                                <span class="vertical-timeline-element-date"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-errors-header" role="tabpanel">
                                    <div class="scroll-area-sm">
                                        <div class="scrollbar-container">
                                            <div class="no-results pt-3 pb-0">
                                                <div class="swal2-icon swal2-success swal2-animate-success-icon">
                                                    <div class="swal2-success-circular-line-left"
                                                         style="background-color: rgb(255, 255, 255);"></div>
                                                    <span class="swal2-success-line-tip"></span>
                                                    <span class="swal2-success-line-long"></span>
                                                    <div class="swal2-success-ring"></div>
                                                    <div class="swal2-success-fix"
                                                         style="background-color: rgb(255, 255, 255);"></div>
                                                    <div class="swal2-success-circular-line-right"
                                                         style="background-color: rgb(255, 255, 255);"></div>
                                                </div>
                                                <div class="results-subtitle">All caught up!</div>
                                                <div class="results-title">There are no system errors!</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ul class="nav flex-column">
                                <li class="nav-item-divider nav-item"></li>
                                <li class="nav-item-btn text-center nav-item">
                                    <button class="btn-shadow btn-wide btn-pill btn btn-focus btn-sm">View Latest
                                        Changes
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="dropdown">
                        <button type="button" data-toggle="dropdown" class="p-0 mr-2 btn btn-link">
                                <span class="icon-wrapper icon-wrapper-alt rounded-circle">
                                    <span class="icon-wrapper-bg bg-focus"></span>
                                    <span class="language-icon opacity-8 flag large DE"></span>
                                </span>
                        </button>
                        <div tabindex="-1" role="menu" aria-hidden="true"
                             class="rm-pointers dropdown-menu dropdown-menu-right">
                            <div class="dropdown-menu-header">
                                <div class="dropdown-menu-header-inner pt-4 pb-4 bg-focus">
                                    <div class="menu-header-image opacity-05"
                                         style="background-image: url('../assets/images/dropdown-header/city2.jpg');">
                                    </div>
                                    <div class="menu-header-content text-center text-white">
                                        <h6 class="menu-header-subtitle mt-0"> Choose Language</h6>
                                    </div>
                                </div>
                            </div>
                            <h6 tabindex="-1" class="dropdown-header"> Popular Languages</h6>
                            <button type="button" tabindex="0" class="dropdown-item">
                                <span class="mr-3 opacity-8 flag large US"></span> USA
                            </button>
                            <button type="button" tabindex="0" class="dropdown-item">
                                <span class="mr-3 opacity-8 flag large CH"></span> Switzerland
                            </button>
                            <button type="button" tabindex="0" class="dropdown-item">
                                <span class="mr-3 opacity-8 flag large FR"></span> France
                            </button>
                            <button type="button" tabindex="0" class="dropdown-item">
                                <span class="mr-3 opacity-8 flag large ES"></span>Spain
                            </button>
                            <div tabindex="-1" class="dropdown-divider"></div>
                            <h6 tabindex="-1" class="dropdown-header">Others</h6>
                            <button type="button" tabindex="0" class="dropdown-item active">
                                <span class="mr-3 opacity-8 flag large DE"></span> Germany
                            </button>
                            <button type="button" tabindex="0" class="dropdown-item">
                                <span class="mr-3 opacity-8 flag large IT"></span> Italy
                            </button>
                        </div>
                    </div>
                    <div class="dropdown">
                        <button type="button" aria-haspopup="true" data-toggle="dropdown" aria-expanded="false"
                                class="p-0 btn btn-link dd-chart-btn">
                                <span class="icon-wrapper icon-wrapper-alt rounded-circle">
                                    <span class="icon-wrapper-bg bg-success"></span>
                                    <i class="icon text-success ion-ios-analytics"></i>
                                </span>
                        </button>
                        <div tabindex="-1" role="menu" aria-hidden="true"
                             class="dropdown-menu-xl rm-pointers dropdown-menu dropdown-menu-right">
                            <div class="dropdown-menu-header">
                                <div class="dropdown-menu-header-inner bg-premium-dark">
                                    <div class="menu-header-image"
                                         style="background-image: url('../assets/images/dropdown-header/abstract4.jpg');">
                                    </div>
                                    <div class="menu-header-content text-white">
                                        <h5 class="menu-header-title">Users Online</h5>
                                        <h6 class="menu-header-subtitle">Recent Account Activity Overview</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-chart">
                                <div class="widget-chart-content">
                                    <div class="icon-wrapper rounded-circle">
                                        <div class="icon-wrapper-bg opacity-9 bg-focus"></div>
                                        <i class="lnr-users text-white"></i>
                                    </div>
                                    <div class="widget-numbers">
                                        <span>344k</span>
                                    </div>
                                    <div class="widget-subheading pt-2">
                                        Profile views since last login
                                    </div>
                                    <div class="widget-description text-danger">
                                        <span class="pr-1"><span>176%</span></span>
                                        <i class="fa fa-arrow-left"></i>
                                    </div>
                                </div>
                                <div class="widget-chart-wrapper">
                                    <div id="dashboard-sparkline-carousel-3-pop"></div>
                                </div>
                            </div>
                            <ul class="nav flex-column">
                                <li class="nav-item-divider mt-0 nav-item"></li>
                                <li class="nav-item-btn text-center nav-item">
                                    <button class="btn-shine btn-wide btn-pill btn btn-warning btn-sm">
                                        <i class="fa fa-cog fa-spin mr-2"></i>View Details
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="header-btn-lg pr-0">
                    <div class="widget-content p-0">
                        <div class="widget-content-wrapper">
                            <div class="widget-content-left">
                                <div class="btn-group">
                                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                       class="p-0 btn">
                                        <c:if test="${sessionScope.sessionUser.image ==null}">
                                            <img width="42" height="42" class="rounded-circle"
                                                 src="../assets/images/avatars/13.jpg" alt="">
                                        </c:if>
                                        <c:if test="${sessionScope.sessionUser.image !=null}">
                                            <img width="42" height="42" class="rounded-circle"
                                                 src="/getimage/${sessionScope.sessionUser.image}" alt="">
                                        </c:if>
                                        <i class="fa fa-angle-down ml-2 opacity-8"></i>
                                    </a>
                                    <div tabindex="-1" role="menu" aria-hidden="true"
                                         class="rm-pointers dropdown-menu-lg dropdown-menu dropdown-menu-right">
                                        <div class="dropdown-menu-header">
                                            <div class="dropdown-menu-header-inner bg-info">
                                                <div class="menu-header-image opacity-2"
                                                     style="background-image: url('../assets/images/dropdown-header/city3.jpg');">
                                                </div>
                                                <div class="menu-header-content text-left">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-wrapper">
                                                            <div class="widget-content-left mr-3">
                                                                <c:if test="${sessionScope.sessionUser.image ==null}">
                                                                    <img width="42" height="42" class="rounded-circle"
                                                                         src="../assets/images/avatars/13.jpg" alt="">
                                                                </c:if>
                                                                <c:if test="${sessionScope.sessionUser.image !=null}">
                                                                    <img width="42" height="42" class="rounded-circle"
                                                                         src="/getimage/${sessionScope.sessionUser.image}"
                                                                         alt="">
                                                                </c:if>
                                                            </div>
                                                            <div class="widget-content-left">
                                                                <div class="widget-heading">${sessionScope.sessionUser.name}</div>
                                                                <div class="widget-subheading opacity-8">
                                                                    Phone: ${sessionScope.sessionUser.phone}</div>
                                                            </div>
                                                            <div class="widget-content-right mr-2">
                                                                <a href="/signout"
                                                                   class="btn-pill btn-shadow btn-shine btn btn-focus">Logout</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="scroll-area-xs" style="height: 150px;">
                                            <div class="scrollbar-container ps">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item-header nav-item">Activity</li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Chat
                                                            <div class="ml-auto badge badge-pill badge-info">8</div>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Recover
                                                            Password</a>
                                                    </li>
                                                    <li class="nav-item-header nav-item">My Account
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Settings
                                                            <div class="ml-auto badge badge-success">New</div>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Messages
                                                            <div class="ml-auto badge badge-warning">512</div>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Logs</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <ul class="nav flex-column">
                                            <li class="nav-item-divider mb-0 nav-item"></li>
                                        </ul>
                                        <div class="grid-menu grid-menu-2col">
                                            <div class="no-gutters row">
                                                <div class="col-sm-6">
                                                    <button
                                                            class="btn-icon-vertical btn-transition btn-transition-alt pt-2 pb-2 btn btn-outline-warning">
                                                        <i
                                                                class="pe-7s-chat icon-gradient bg-amy-crisp btn-icon-wrapper mb-2"></i>
                                                        Message Inbox
                                                    </button>
                                                </div>
                                                <div class="col-sm-6">
                                                    <button
                                                            class="btn-icon-vertical btn-transition btn-transition-alt pt-2 pb-2 btn btn-outline-danger">
                                                        <i
                                                                class="pe-7s-ticket icon-gradient bg-love-kiss btn-icon-wrapper mb-2"></i>
                                                        <b>Support Tickets</b>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="nav flex-column">
                                            <li class="nav-item-divider nav-item">
                                            </li>
                                            <li class="nav-item-btn text-center nav-item">
                                                <button class="btn-wide btn btn-primary btn-sm"> Open Messages
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-content-left  ml-3 header-user-info">
                                <div class="widget-heading">${sessionScope.sessionUser.name}</div>
                                <div class="widget-subheading"> VP People Manager</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="ui-theme-settings">
        <button type="button" id="TooltipDemo" class="btn-open-options btn btn-warning">
            <i class="fa fa-cog fa-w-16 fa-spin fa-2x"></i>
        </button>
        <div class="theme-settings__inner">
            <div class="scrollbar-container">
                <div class="theme-settings__options-wrapper">
                    <h3 class="themeoptions-heading">Layout Options</h3>
                    <div class="p-3">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <div class="widget-content p-0">
                                    <div class="widget-content-wrapper">
                                        <div class="widget-content-left mr-3">
                                            <div class="switch has-switch switch-container-class"
                                                 data-class="fixed-header">
                                                <div class="switch-animate switch-on">
                                                    <input type="checkbox" checked data-toggle="toggle"
                                                           data-onstyle="success">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget-content-left">
                                            <div class="widget-heading">Fixed Header</div>
                                            <div class="widget-subheading">Makes the header top fixed, always
                                                visible!
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="widget-content p-0">
                                    <div class="widget-content-wrapper">
                                        <div class="widget-content-left mr-3">
                                            <div class="switch has-switch switch-container-class"
                                                 data-class="fixed-sidebar">
                                                <div class="switch-animate switch-on">
                                                    <input type="checkbox" checked data-toggle="toggle"
                                                           data-onstyle="success">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget-content-left">
                                            <div class="widget-heading">Fixed Sidebar</div>
                                            <div class="widget-subheading">Makes the sidebar left fixed, always
                                                visible!
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="widget-content p-0">
                                    <div class="widget-content-wrapper">
                                        <div class="widget-content-left mr-3">
                                            <div class="switch has-switch switch-container-class"
                                                 data-class="fixed-footer">
                                                <div class="switch-animate switch-off">
                                                    <input type="checkbox" data-toggle="toggle"
                                                           data-onstyle="success">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget-content-left">
                                            <div class="widget-heading">Fixed Footer</div>
                                            <div class="widget-subheading">Makes the app footer bottom fixed, always
                                                visible!
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <h3 class="themeoptions-heading">
                        <div> Header Options</div>
                        <button type="button"
                                class="btn-pill btn-shadow btn-wide ml-auto btn btn-focus btn-sm switch-header-cs-class"
                                data-class="">
                            Restore Default
                        </button>
                    </h3>
                    <div class="p-3">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <h5 class="pb-2">Choose Color Scheme</h5>
                                <div class="theme-settings-swatches">
                                    <div class="swatch-holder bg-primary switch-header-cs-class"
                                         data-class="bg-primary header-text-light"></div>
                                    <div class="swatch-holder bg-secondary switch-header-cs-class"
                                         data-class="bg-secondary header-text-light"></div>
                                    <div class="swatch-holder bg-success switch-header-cs-class"
                                         data-class="bg-success header-text-light"></div>
                                    <div class="swatch-holder bg-info switch-header-cs-class"
                                         data-class="bg-info header-text-light"></div>
                                    <div class="swatch-holder bg-warning switch-header-cs-class"
                                         data-class="bg-warning header-text-dark"></div>
                                    <div class="swatch-holder bg-danger switch-header-cs-class"
                                         data-class="bg-danger header-text-light"></div>
                                    <div class="swatch-holder bg-light switch-header-cs-class"
                                         data-class="bg-light header-text-dark"></div>
                                    <div class="swatch-holder bg-dark switch-header-cs-class"
                                         data-class="bg-dark header-text-light"></div>
                                    <div class="swatch-holder bg-focus switch-header-cs-class"
                                         data-class="bg-focus header-text-light"></div>
                                    <div class="swatch-holder bg-alternate switch-header-cs-class"
                                         data-class="bg-alternate header-text-light"></div>
                                    <div class="divider"></div>
                                    <div class="swatch-holder bg-vicious-stance switch-header-cs-class"
                                         data-class="bg-vicious-stance header-text-light"></div>
                                    <div class="swatch-holder bg-midnight-bloom switch-header-cs-class"
                                         data-class="bg-midnight-bloom header-text-light"></div>
                                    <div class="swatch-holder bg-night-sky switch-header-cs-class"
                                         data-class="bg-night-sky header-text-light"></div>
                                    <div class="swatch-holder bg-slick-carbon switch-header-cs-class"
                                         data-class="bg-slick-carbon header-text-light"></div>
                                    <div class="swatch-holder bg-asteroid switch-header-cs-class"
                                         data-class="bg-asteroid header-text-light"></div>
                                    <div class="swatch-holder bg-royal switch-header-cs-class"
                                         data-class="bg-royal header-text-light"></div>
                                    <div class="swatch-holder bg-warm-flame switch-header-cs-class"
                                         data-class="bg-warm-flame header-text-dark"></div>
                                    <div class="swatch-holder bg-night-fade switch-header-cs-class"
                                         data-class="bg-night-fade header-text-dark"></div>
                                    <div class="swatch-holder bg-sunny-morning switch-header-cs-class"
                                         data-class="bg-sunny-morning header-text-dark"></div>
                                    <div class="swatch-holder bg-tempting-azure switch-header-cs-class"
                                         data-class="bg-tempting-azure header-text-dark"></div>
                                    <div class="swatch-holder bg-amy-crisp switch-header-cs-class"
                                         data-class="bg-amy-crisp header-text-dark"></div>
                                    <div class="swatch-holder bg-heavy-rain switch-header-cs-class"
                                         data-class="bg-heavy-rain header-text-dark"></div>
                                    <div class="swatch-holder bg-mean-fruit switch-header-cs-class"
                                         data-class="bg-mean-fruit header-text-dark"></div>
                                    <div class="swatch-holder bg-malibu-beach switch-header-cs-class"
                                         data-class="bg-malibu-beach header-text-light"></div>
                                    <div class="swatch-holder bg-deep-blue switch-header-cs-class"
                                         data-class="bg-deep-blue header-text-dark"></div>
                                    <div class="swatch-holder bg-ripe-malin switch-header-cs-class"
                                         data-class="bg-ripe-malin header-text-light"></div>
                                    <div class="swatch-holder bg-arielle-smile switch-header-cs-class"
                                         data-class="bg-arielle-smile header-text-light"></div>
                                    <div class="swatch-holder bg-plum-plate switch-header-cs-class"
                                         data-class="bg-plum-plate header-text-light"></div>
                                    <div class="swatch-holder bg-happy-fisher switch-header-cs-class"
                                         data-class="bg-happy-fisher header-text-dark"></div>
                                    <div class="swatch-holder bg-happy-itmeo switch-header-cs-class"
                                         data-class="bg-happy-itmeo header-text-light"></div>
                                    <div class="swatch-holder bg-mixed-hopes switch-header-cs-class"
                                         data-class="bg-mixed-hopes header-text-light"></div>
                                    <div class="swatch-holder bg-strong-bliss switch-header-cs-class"
                                         data-class="bg-strong-bliss header-text-light"></div>
                                    <div class="swatch-holder bg-grow-early switch-header-cs-class"
                                         data-class="bg-grow-early header-text-light"></div>
                                    <div class="swatch-holder bg-love-kiss switch-header-cs-class"
                                         data-class="bg-love-kiss header-text-light"></div>
                                    <div class="swatch-holder bg-premium-dark switch-header-cs-class"
                                         data-class="bg-premium-dark header-text-light"></div>
                                    <div class="swatch-holder bg-happy-green switch-header-cs-class"
                                         data-class="bg-happy-green header-text-light"></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <h3 class="themeoptions-heading">
                        <div>Sidebar Options</div>
                        <button type="button"
                                class="btn-pill btn-shadow btn-wide ml-auto btn btn-focus btn-sm switch-sidebar-cs-class"
                                data-class="">
                            Restore Default
                        </button>
                    </h3>
                    <div class="p-3">
                        <ul class="list-group">

                            <li class="list-group-item">
                                <h5 class="pb-2">Choose Color Scheme</h5>
                                <div class="theme-settings-swatches">
                                    <div class="swatch-holder bg-primary switch-sidebar-cs-class"
                                         data-class="bg-primary sidebar-text-light"></div>
                                    <div class="swatch-holder bg-secondary switch-sidebar-cs-class"
                                         data-class="bg-secondary sidebar-text-light"></div>
                                    <div class="swatch-holder bg-success switch-sidebar-cs-class"
                                         data-class="bg-success sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-info switch-sidebar-cs-class"
                                         data-class="bg-info sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-warning switch-sidebar-cs-class"
                                         data-class="bg-warning sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-danger switch-sidebar-cs-class"
                                         data-class="bg-danger sidebar-text-light"></div>
                                    <div class="swatch-holder bg-light switch-sidebar-cs-class"
                                         data-class="bg-light sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-dark switch-sidebar-cs-class"
                                         data-class="bg-dark sidebar-text-light"></div>
                                    <div class="swatch-holder bg-focus switch-sidebar-cs-class"
                                         data-class="bg-focus sidebar-text-light"></div>
                                    <div class="swatch-holder bg-alternate switch-sidebar-cs-class"
                                         data-class="bg-alternate sidebar-text-light"></div>
                                    <div class="divider"></div>
                                    <div class="swatch-holder bg-vicious-stance switch-sidebar-cs-class"
                                         data-class="bg-vicious-stance sidebar-text-light"></div>
                                    <div class="swatch-holder bg-midnight-bloom switch-sidebar-cs-class"
                                         data-class="bg-midnight-bloom sidebar-text-light"></div>
                                    <div class="swatch-holder bg-night-sky switch-sidebar-cs-class"
                                         data-class="bg-night-sky sidebar-text-light"></div>
                                    <div class="swatch-holder bg-slick-carbon switch-sidebar-cs-class"
                                         data-class="bg-slick-carbon sidebar-text-light"></div>
                                    <div class="swatch-holder bg-asteroid switch-sidebar-cs-class"
                                         data-class="bg-asteroid sidebar-text-light"></div>
                                    <div class="swatch-holder bg-royal switch-sidebar-cs-class"
                                         data-class="bg-royal sidebar-text-light"></div>
                                    <div class="swatch-holder bg-warm-flame switch-sidebar-cs-class"
                                         data-class="bg-warm-flame sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-night-fade switch-sidebar-cs-class"
                                         data-class="bg-night-fade sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-sunny-morning switch-sidebar-cs-class"
                                         data-class="bg-sunny-morning sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-tempting-azure switch-sidebar-cs-class"
                                         data-class="bg-tempting-azure sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-amy-crisp switch-sidebar-cs-class"
                                         data-class="bg-amy-crisp sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-heavy-rain switch-sidebar-cs-class"
                                         data-class="bg-heavy-rain sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-mean-fruit switch-sidebar-cs-class"
                                         data-class="bg-mean-fruit sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-malibu-beach switch-sidebar-cs-class"
                                         data-class="bg-malibu-beach sidebar-text-light"></div>
                                    <div class="swatch-holder bg-deep-blue switch-sidebar-cs-class"
                                         data-class="bg-deep-blue sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-ripe-malin switch-sidebar-cs-class"
                                         data-class="bg-ripe-malin sidebar-text-light"></div>
                                    <div class="swatch-holder bg-arielle-smile switch-sidebar-cs-class"
                                         data-class="bg-arielle-smile sidebar-text-light"></div>
                                    <div class="swatch-holder bg-plum-plate switch-sidebar-cs-class"
                                         data-class="bg-plum-plate sidebar-text-light"></div>
                                    <div class="swatch-holder bg-happy-fisher switch-sidebar-cs-class"
                                         data-class="bg-happy-fisher sidebar-text-dark"></div>
                                    <div class="swatch-holder bg-happy-itmeo switch-sidebar-cs-class"
                                         data-class="bg-happy-itmeo sidebar-text-light"></div>
                                    <div class="swatch-holder bg-mixed-hopes switch-sidebar-cs-class"
                                         data-class="bg-mixed-hopes sidebar-text-light"></div>
                                    <div class="swatch-holder bg-strong-bliss switch-sidebar-cs-class"
                                         data-class="bg-strong-bliss sidebar-text-light"></div>
                                    <div class="swatch-holder bg-grow-early switch-sidebar-cs-class"
                                         data-class="bg-grow-early sidebar-text-light"></div>
                                    <div class="swatch-holder bg-love-kiss switch-sidebar-cs-class"
                                         data-class="bg-love-kiss sidebar-text-light"></div>
                                    <div class="swatch-holder bg-premium-dark switch-sidebar-cs-class"
                                         data-class="bg-premium-dark sidebar-text-light"></div>
                                    <div class="swatch-holder bg-happy-green switch-sidebar-cs-class"
                                         data-class="bg-happy-green sidebar-text-light"></div>
                                </div>
                            </li>


                        </ul>
                    </div>
                    <h3 class="themeoptions-heading">
                        <div>Main Content Options</div>
                        <button type="button"
                                class="btn-pill btn-shadow btn-wide ml-auto active btn btn-focus btn-sm">Restore
                            Default
                        </button>
                    </h3>
                    <div class="p-3">
                        <ul class="list-group">

                            <li class="list-group-item">
                                <h5 class="pb-2">Page Section Tabs</h5>
                                <div class="theme-settings-swatches">
                                    <div role="group" class="mt-2 btn-group">
                                        <button type="button"
                                                class="btn-wide btn-shadow btn-primary btn btn-secondary switch-theme-class"
                                                data-class="body-tabs-line"> Line
                                        </button>
                                        <button type="button"
                                                class="btn-wide btn-shadow btn-primary active btn btn-secondary switch-theme-class"
                                                data-class="body-tabs-shadow"> Shadow
                                        </button>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <h5 class="pb-2">Light Color Schemes
                                </h5>
                                <div class="theme-settings-swatches">
                                    <div role="group" class="mt-2 btn-group">
                                        <button type="button"
                                                class="btn-wide btn-shadow btn-primary active btn btn-secondary switch-theme-class"
                                                data-class="app-theme-white"> White Theme
                                        </button>
                                        <button type="button"
                                                class="btn-wide btn-shadow btn-primary btn btn-secondary switch-theme-class"
                                                data-class="app-theme-gray"> Gray Theme
                                        </button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="app-main">
        <div class="app-sidebar sidebar-shadow">
            <div class="app-header__logo">
                <div class="logo-src"></div>
                <div class="header__pane ml-auto">
                    <div>
                        <button type="button" class="hamburger close-sidebar-btn hamburger--elastic"
                                data-class="closed-sidebar">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="app-header__mobile-menu">
                <div>
                    <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                    </button>
                </div>
            </div>
            <div class="app-header__menu">
                    <span>
                        <button type="button"
                                class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                            <span class="btn-icon-wrapper">
                                <i class="fa fa-ellipsis-v fa-w-6"></i>
                            </span>
                        </button>
                    </span>
            </div>
            <div class="scrollbar-sidebar">
                <div class="app-sidebar__inner">
                    <ul class="vertical-nav-menu">
                        <li class="app-sidebar__heading">Menu</li>
                        <li class="mm-active">
                            <a href="#">
                                <i class="metismenu-icon pe-7s-rocket"></i>Manage
                                <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                            </a>
                            <ul>
                                <c:if test="${sessionScope.sessionUser.isAdmin==0}">
                                    <li>
                                        <a href="/user/index"
                                           class="
                                        <c:if test="${active==1}">
                                            mm-active
                                        </c:if>">
                                            <i class="metismenu-icon"></i>User
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/area/index"
                                           class="
                                        <c:if test="${active==2 || active==5}">
                                            mm-active
                                        </c:if>">
                                            <i class="metismenu-icon"></i>Area and table
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/water/index"
                                           class="
                                        <c:if test="${active==3}">
                                            mm-active
                                        </c:if>">
                                            <i class="metismenu-icon">
                                            </i>Water
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/order/index"
                                           class="
                                        <c:if test="${active==4}">
                                            mm-active
                                        </c:if>">
                                            <i class="metismenu-icon"></i> Order
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.sessionUser.isAdmin==1}">
                                    <li>
                                        <a href="/order/index"
                                           class="
                                        <c:if test="${active==4}">
                                            mm-active
                                        </c:if>">
                                            <i class="metismenu-icon"></i> Order
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="app-main__outer">
            <div class="app-main__inner">
                <jsp:include page="${view}"></jsp:include>
            </div>
        </div>
    </div>
</div>

<div class="app-drawer-wrapper">
    <div class="drawer-nav-btn">
        <button type="button" class="hamburger hamburger--elastic is-active">
            <span class="hamburger-box"><span class="hamburger-inner"></span></span>
        </button>
    </div>
    <div class="drawer-content-wrapper">
        <div class="scrollbar-container">
            <h3 class="drawer-heading">Servers Status</h3>
            <div class="drawer-section">
                <div class="row">
                    <div class="col">
                        <div class="progress-box">
                            <h4>Server Load 1</h4>
                            <div class="circle-progress circle-progress-gradient-xl mx-auto">
                                <small></small>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="progress-box">
                            <h4>Server Load 2</h4>
                            <div class="circle-progress circle-progress-success-xl mx-auto">
                                <small></small>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="progress-box">
                            <h4>Server Load 3</h4>
                            <div class="circle-progress circle-progress-danger-xl mx-auto">
                                <small></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="divider"></div>
                <div class="mt-3">
                    <h5 class="text-center card-title">Live Statistics</h5>
                    <div id="sparkline-carousel-3"></div>
                    <div class="row">
                        <div class="col">
                            <div class="widget-chart p-0">
                                <div class="widget-chart-content">
                                    <div class="widget-numbers text-warning fsize-3">43</div>
                                    <div class="widget-subheading pt-1">Packages</div>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="widget-chart p-0">
                                <div class="widget-chart-content">
                                    <div class="widget-numbers text-danger fsize-3">65</div>
                                    <div class="widget-subheading pt-1">Dropped</div>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="widget-chart p-0">
                                <div class="widget-chart-content">
                                    <div class="widget-numbers text-success fsize-3">18</div>
                                    <div class="widget-subheading pt-1">Invalid</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="divider"></div>
                    <div class="text-center mt-2 d-block">
                        <button class="mr-2 border-0 btn-transition btn btn-outline-danger">Escalate Issue</button>
                        <button class="border-0 btn-transition btn btn-outline-success">Support Center</button>
                    </div>
                </div>
            </div>
            <h3 class="drawer-heading">File Transfers</h3>
            <div class="drawer-section p-0">
                <div class="files-box">
                    <ul class="list-group list-group-flush">
                        <li class="pt-2 pb-2 pr-2 list-group-item">
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div
                                            class="widget-content-left opacity-6 fsize-2 mr-3 text-primary center-elem">
                                        <i class="fa fa-file-alt"></i>
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-heading font-weight-normal">TPSReport.docx</div>
                                    </div>
                                    <div class="widget-content-right widget-content-actions">
                                        <button class="btn-icon btn-icon-only btn btn-link btn-sm">
                                            <i class="fa fa-cloud-download-alt"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="pt-2 pb-2 pr-2 list-group-item">
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div
                                            class="widget-content-left opacity-6 fsize-2 mr-3 text-warning center-elem">
                                        <i class="fa fa-file-archive"></i>
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-heading font-weight-normal">Latest_photos.zip</div>
                                    </div>
                                    <div class="widget-content-right widget-content-actions">
                                        <button class="btn-icon btn-icon-only btn btn-link btn-sm">
                                            <i class="fa fa-cloud-download-alt"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="pt-2 pb-2 pr-2 list-group-item">
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div class="widget-content-left opacity-6 fsize-2 mr-3 text-danger center-elem">
                                        <i class="fa fa-file-pdf"></i>
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-heading font-weight-normal">Annual Revenue.pdf</div>
                                    </div>
                                    <div class="widget-content-right widget-content-actions">
                                        <button class="btn-icon btn-icon-only btn btn-link btn-sm">
                                            <i class="fa fa-cloud-download-alt"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="pt-2 pb-2 pr-2 list-group-item">
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div
                                            class="widget-content-left opacity-6 fsize-2 mr-3 text-success center-elem">
                                        <i class="fa fa-file-excel"></i>
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-heading font-weight-normal">Analytics_GrowthReport.xls
                                        </div>
                                    </div>
                                    <div class="widget-content-right widget-content-actions">
                                        <button class="btn-icon btn-icon-only btn btn-link btn-sm">
                                            <i class="fa fa-cloud-download-alt"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <h3 class="drawer-heading">Tasks in Progress</h3>
            <div class="drawer-section p-0">
                <div class="todo-box">
                    <ul class="todo-list-wrapper list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="todo-indicator bg-warning"></div>
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div class="widget-content-left mr-2">
                                        <div class="custom-checkbox custom-control">
                                            <input type="checkbox" id="exampleCustomCheckbox1266"
                                                   class="custom-control-input">
                                            <label class="custom-control-label"
                                                   for="exampleCustomCheckbox1266">&nbsp;</label>
                                        </div>
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-heading">Wash the car
                                            <div class="badge badge-danger ml-2">Rejected</div>
                                        </div>
                                        <div class="widget-subheading"><i>Written by Bob</i></div>
                                    </div>
                                    <div class="widget-content-right widget-content-actions">
                                        <button class="border-0 btn-transition btn btn-outline-success">
                                            <i class="fa fa-check"></i>
                                        </button>
                                        <button class="border-0 btn-transition btn btn-outline-danger">
                                            <i class="fa fa-trash-alt"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="todo-indicator bg-focus"></div>
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div class="widget-content-left mr-2">
                                        <div class="custom-checkbox custom-control">
                                            <input type="checkbox" id="exampleCustomCheckbox1666"
                                                   class="custom-control-input">
                                            <label class="custom-control-label"
                                                   for="exampleCustomCheckbox1666">&nbsp;</label>
                                        </div>
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-heading">Task with hover dropdown menu</div>
                                        <div class="widget-subheading">
                                            <div>By Johnny
                                                <div class="badge badge-pill badge-info ml-2">NEW</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget-content-right widget-content-actions">
                                        <div class="d-inline-block dropdown">
                                            <button type="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false" class="border-0 btn-transition btn btn-link">
                                                <i class="fa fa-ellipsis-h"></i>
                                            </button>
                                            <div tabindex="-1" role="menu" aria-hidden="true"
                                                 class="dropdown-menu dropdown-menu-right">
                                                <h6 tabindex="-1" class="dropdown-header">Header</h6>
                                                <button type="button" disabled="" tabindex="-1"
                                                        class="disabled dropdown-item">Action
                                                </button>
                                                <button type="button" tabindex="0" class="dropdown-item">Another
                                                    Action
                                                </button>
                                                <div tabindex="-1" class="dropdown-divider"></div>
                                                <button type="button" tabindex="0" class="dropdown-item">Another
                                                    Action
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="todo-indicator bg-primary"></div>
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div class="widget-content-left mr-2">
                                        <div class="custom-checkbox custom-control">
                                            <input type="checkbox" id="exampleCustomCheckbox4777"
                                                   class="custom-control-input">
                                            <label class="custom-control-label"
                                                   for="exampleCustomCheckbox4777">&nbsp;</label>
                                        </div>
                                    </div>
                                    <div class="widget-content-left flex2">
                                        <div class="widget-heading">Badge on the right task</div>
                                        <div class="widget-subheading">This task has show on hover actions!</div>
                                    </div>
                                    <div class="widget-content-right widget-content-actions">
                                        <button class="border-0 btn-transition btn btn-outline-success">
                                            <i class="fa fa-check"></i>
                                        </button>
                                    </div>
                                    <div class="widget-content-right ml-3">
                                        <div class="badge badge-pill badge-success">Latest Task</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="todo-indicator bg-info"></div>
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div class="widget-content-left mr-2">
                                        <div class="custom-checkbox custom-control">
                                            <input type="checkbox" id="exampleCustomCheckbox2444"
                                                   class="custom-control-input">
                                            <label class="custom-control-label"
                                                   for="exampleCustomCheckbox2444">&nbsp;</label>
                                        </div>
                                    </div>
                                    <div class="widget-content-left mr-3">
                                        <div class="widget-content-left">
                                            <img width="42" class="rounded" src="../assets/images/avatars/1.jpg"
                                                 alt=""/>
                                        </div>
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-heading">Go grocery shopping</div>
                                        <div class="widget-subheading">A short description ...</div>
                                    </div>
                                    <div class="widget-content-right widget-content-actions">
                                        <button class="border-0 btn-transition btn btn-sm btn-outline-success">
                                            <i class="fa fa-check"></i>
                                        </button>
                                        <button class="border-0 btn-transition btn btn-sm btn-outline-danger">
                                            <i class="fa fa-trash-alt"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="todo-indicator bg-success"></div>
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div class="widget-content-left mr-2">
                                        <div class="custom-checkbox custom-control">
                                            <input type="checkbox" id="exampleCustomCheckbox3222"
                                                   class="custom-control-input">
                                            <label class="custom-control-label"
                                                   for="exampleCustomCheckbox3222">&nbsp;</label>
                                        </div>
                                    </div>
                                    <div class="widget-content-left flex2">
                                        <div class="widget-heading">Development Task</div>
                                        <div class="widget-subheading">Finish React ToDo List App</div>
                                    </div>
                                    <div class="widget-content-right">
                                        <div class="badge badge-warning mr-2">69</div>
                                    </div>
                                    <div class="widget-content-right">
                                        <button class="border-0 btn-transition btn btn-outline-success">
                                            <i class="fa fa-check"></i>
                                        </button>
                                        <button class="border-0 btn-transition btn btn-outline-danger">
                                            <i class="fa fa-trash-alt"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <h3 class="drawer-heading">Urgent Notifications</h3>
            <div class="drawer-section">
                <div class="notifications-box">
                    <div
                            class="vertical-time-simple vertical-without-time vertical-timeline vertical-timeline--one-column">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="app-drawer-overlay d-none animated fadeIn"></div>
<script type="text/javascript">
    function submitFormDeleteUser(id) {
        document.getElementById(id).submit();
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
<script type="text/javascript" src="../assets/scripts/main.js"></script>
<script>
    var size = [${listSize.toString()}];
    var waterType = [${listType.toString()}];

    function autocomplete(inp, arr) {
        /*the autocomplete function takes two arguments,
        the text field element and an array of possible autocompleted values:*/
        var currentFocus;
        /*execute a function when someone writes in the text field:*/
        inp.addEventListener("input", function (e) {
            var a, b, i, val = this.value;
            /*close any already open lists of autocompleted values*/
            closeAllLists();
            if (!val) {
                a = document.createElement("DIV");
                a.setAttribute("id", this.id + "autocomplete-list");
                a.setAttribute("class", "autocomplete-items");
                /*append the DIV element as a child of the autocomplete container:*/
                this.parentNode.appendChild(a);
                /*for each item in the array...*/
                for (i = 0; i < arr.length; i++) {
                    /*check if the item starts with the same letters as the text field value:*/
                    /*create a DIV element for each matching element:*/
                    b = document.createElement("DIV");
                    /*make the matching letters bold:*/
                    b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                    b.innerHTML += arr[i].substr(val.length);
                    /*insert a input field that will hold the current array item's value:*/
                    b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                    /*execute a function when someone clicks on the item value (DIV element):*/
                    b.addEventListener("click", function (e) {
                        /*insert the value for the autocomplete text field:*/
                        inp.value = this.getElementsByTagName("input")[0].value;
                        /*close the list of autocompleted values,
                        (or any other open lists of autocompleted values:*/
                        closeAllLists();
                    });
                    a.appendChild(b);

                }
            } else {

                currentFocus = -1;
                /*create a DIV element that will contain the items (values):*/
                a = document.createElement("DIV");
                a.setAttribute("id", this.id + "autocomplete-list");
                a.setAttribute("class", "autocomplete-items");
                /*append the DIV element as a child of the autocomplete container:*/
                this.parentNode.appendChild(a);
                /*for each item in the array...*/
                for (i = 0; i < arr.length; i++) {
                    /*check if the item starts with the same letters as the text field value:*/
                    if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                        /*create a DIV element for each matching element:*/
                        b = document.createElement("DIV");
                        /*make the matching letters bold:*/
                        b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                        b.innerHTML += arr[i].substr(val.length);
                        /*insert a input field that will hold the current array item's value:*/
                        b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                        /*execute a function when someone clicks on the item value (DIV element):*/
                        b.addEventListener("click", function (e) {
                            /*insert the value for the autocomplete text field:*/
                            inp.value = this.getElementsByTagName("input")[0].value;
                            /*close the list of autocompleted values,
                            (or any other open lists of autocompleted values:*/
                            closeAllLists();
                        });
                        a.appendChild(b);
                    }
                }
            }

        });

        /*execute a function presses a key on the keyboard:*/
        inp.addEventListener("keydown", function (e) {
            var x = document.getElementById(this.id + "autocomplete-list");
            if (x) x = x.getElementsByTagName("div");
            if (e.keyCode == 40) {
                /*If the arrow DOWN key is pressed,
                increase the currentFocus variable:*/
                currentFocus++;
                /*and and make the current item more visible:*/
                addActive(x);
            } else if (e.keyCode == 38) { //up
                /*If the arrow UP key is pressed,
                decrease the currentFocus variable:*/
                currentFocus--;
                /*and and make the current item more visible:*/
                addActive(x);
            } else if (e.keyCode == 13) {
                /*If the ENTER key is pressed, prevent the form from being submitted,*/
                e.preventDefault();
                if (currentFocus > -1) {
                    /*and simulate a click on the "active" item:*/
                    if (x) x[currentFocus].click();
                }
            }
        });

        function addActive(x) {
            /*a function to classify an item as "active":*/
            if (!x) return false;
            /*start by removing the "active" class on all items:*/
            removeActive(x);
            if (currentFocus >= x.length) currentFocus = 0;
            if (currentFocus < 0) currentFocus = (x.length - 1);
            /*add class "autocomplete-active":*/
            x[currentFocus].classList.add("autocomplete-active");
        }

        function removeActive(x) {
            /*a function to remove the "active" class from all autocomplete items:*/
            for (var i = 0; i < x.length; i++) {
                x[i].classList.remove("autocomplete-active");
            }
        }

        function closeAllLists(elmnt) {
            /*close all autocomplete lists in the document,
            except the one passed as an argument:*/
            var x = document.getElementsByClassName("autocomplete-items");
            for (var i = 0; i < x.length; i++) {
                if (elmnt != x[i] && elmnt != inp) {
                    x[i].parentNode.removeChild(x[i]);
                }
            }
        }

        /*execute a function when someone clicks in the document:*/
        document.addEventListener("click", function (e) {
            closeAllLists(e.target);
        });
    }
</script>
<script>
    autocomplete(document.getElementById("idSize"), size);
    autocomplete(document.getElementById("idType"), waterType);
</script>
</body>
</html>