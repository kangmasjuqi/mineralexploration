/**
 * First we will load all of this project's JavaScript dependencies which
 * includes React and other helpers. It's a great starting point while
 * building robust, powerful web applications using React + Laravel.
 */

require('./bootstrap');

/**
 * Next, we will create a fresh React component instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

import ReactDOM from 'react-dom';
import Index from "./components/Index";
import HoleIndex from './components/holes/HoleIndex';
import HoleDetail from './components/holes/HoleDetail';
import ReadingUpdate from './components/readings/ReadingUpdate';

import { BrowserRouter as Router, Link, Route } from "react-router-dom";

if (document.getElementById('mineralexploration-app')) {
  ReactDOM.render(<Router><Index /></Router>, document.getElementById('mineralexploration-app'));
}