let oUnit_css = {|
  /**************************************************************************/
  /* The OUnit library                                                      */
  /*                                                                        */
  /* Copyright (C) 2002-2008 Maas-Maarten Zeeman.                           */
  /* Copyright (C) 2010 OCamlCore SARL                                      */
  /* Copyright (C) 2013 Sylvain Le Gall                                     */
  /*                                                                        */
  /* The package OUnit is copyright by Maas-Maarten Zeeman, OCamlCore SARL  */
  /* and Sylvain Le Gall.                                                   */
  /*                                                                        */
  /* Permission is hereby granted, free of charge, to any person obtaining  */
  /* a copy of this document and the OUnit software ("the Software"), to    */
  /* deal in the Software without restriction, including without limitation */
  /* the rights to use, copy, modify, merge, publish, distribute,           */
  /* sublicense, and/or sell copies of the Software, and to permit persons  */
  /* to whom the Software is furnished to do so, subject to the following   */
  /* conditions:                                                            */
  /*                                                                        */
  /* The above copyright notice and this permission notice shall be         */
  /* included in all copies or substantial portions of the Software.        */
  /*                                                                        */
  /* The Software is provided ``as is'', without warranty of any kind,      */
  /* express or implied, including but not limited to the warranties of     */
  /* merchantability, fitness for a particular purpose and noninfringement. */
  /* In no event shall Maas-Maarten Zeeman be liable for any claim, damages */
  /* or other liability, whether in an action of contract, tort or          */
  /* otherwise, arising from, out of or in connection with the Software or  */
  /* the use or other dealings in the software.                             */
  /*                                                                        */
  /* See LICENSE.txt for details.                                           */
  /**************************************************************************/

  h1 {
    font-size: 26px;
    margin-right: 15px;
    padding-left: 0px;
  }

  h2 {
    font-size: 20px;
    margin-right: 15px;
    padding-left: 5px;
  }

  #ounit-current h2 {
    text-decoration: underline;
  }

  #ounit-results-started-at {
    width: 100%;
  }

  .ounit-results-content div {
    width: 150px;
    margin-top: 1px;
  }

  .ounit-results-content .number {
    text-align: right;
    display: inline-block;
    float: right;
    width: 50px;
  }

  .ounit-results-verdict.ounit-failure {
    color: red;
  }

  .ounit-success h2,
  .ounit-results-successes .number {
    background-color: #4a4;
  }

  .ounit-failure h2,
  .ounit-results-failures .number {
    background-color: #f66;
  }

  .ounit-error h2,
  .ounit-results-errors .number {
    background-color: #000;
    color: #fff;
  }

  .ounit-skip h2,
  .ounit-results-skips .number {
    background-color: #fd0;
  }

  .ounit-todo h2,
  .ounit-results-todos .number {
    background-color: #aaf;
  }

  .ounit-timeout h2,
  .ounit-results-timeouts .number {
    background-color: #888;
  }

  .ounit-conf h2,
  .ounit-results h2 {
    background-color: #aaa;
  }

  .ounit-log,
  .ounit-conf-content {
    font-family: Lucida Console, Monaco, Courier New, monospace;
    white-space: nowrap;
    font-size: 16px;
    color: #666;
    margin-left: 20px;
  }

  .ounit-duration,
  .ounit-started-at,
  .ounit-results-content {
    margin-bottom: 10px;
    margin-left: 15px;
  }

  .ounit-started-at {
    margin-bottom: 0;
  }

  span.ounit-timestamp {
    display: inline-block;
    width: 70px;
  }

  .ounit-log .ounit-result,
  .ounit-results-verdict {
    font-weight: bold;
    margin-top: 5px;
  }

  #navigation {
    position: fixed;
    top: 0;
    right: 0;
    background-color: #fff;
    padding: 9px;
    border: 1px solid #000;
    border-top: none;
    border-right: none;
  };
|};;

let oUnit_js = {|
  /**************************************************************************/
  /* The OUnit library                                                      */
  /*                                                                        */
  /* Copyright (C) 2002-2008 Maas-Maarten Zeeman.                           */
  /* Copyright (C) 2010 OCamlCore SARL                                      */
  /* Copyright (C) 2013 Sylvain Le Gall                                     */
  /*                                                                        */
  /* The package OUnit is copyright by Maas-Maarten Zeeman, OCamlCore SARL  */
  /* and Sylvain Le Gall.                                                   */
  /*                                                                        */
  /* Permission is hereby granted, free of charge, to any person obtaining  */
  /* a copy of this document and the OUnit software ("the Software"), to    */
  /* deal in the Software without restriction, including without limitation */
  /* the rights to use, copy, modify, merge, publish, distribute,           */
  /* sublicense, and/or sell copies of the Software, and to permit persons  */
  /* to whom the Software is furnished to do so, subject to the following   */
  /* conditions:                                                            */
  /*                                                                        */
  /* The above copyright notice and this permission notice shall be         */
  /* included in all copies or substantial portions of the Software.        */
  /*                                                                        */
  /* The Software is provided ``as is'', without warranty of any kind,      */
  /* express or implied, including but not limited to the warranties of     */
  /* merchantability, fitness for a particular purpose and noninfringement. */
  /* In no event shall Maas-Maarten Zeeman be liable for any claim, damages */
  /* or other liability, whether in an action of contract, tort or          */
  /* otherwise, arising from, out of or in connection with the Software or  */
  /* the use or other dealings in the software.                             */
  /*                                                                        */
  /* See LICENSE.txt for details.                                           */
  /**************************************************************************/

  var successHidden = true;

  function displaySuccess(display) {
    var div = document.getElementsByClassName('ounit-success');
    for (var i = 0; i < div.length; i++) {
      div[i].style.display = display;
    };
  };

  function toggleSuccess() {
    if (successHidden) {
      displaySuccess('block');
    } else {
      displaySuccess('none');
    };
    successHidden = ! successHidden;
    var button = document.getElementById('toggleVisibiltySuccess');
    if (successHidden) {
      button.textContent = 'Show success';
    } else {
      button.textContent = 'Hide success';
    };
  };

  function resetTestCurrent() {
    var div = document.getElementById('ounit-current');
    if (div) {
      div.removeAttribute('id');
    };
  };

  function setTestCurrent(div) {
    resetTestCurrent();
    div.id = "ounit-current";
    div.scrollIntoView(true);
  };

  function nextTest() {
    var div = document.getElementsByClassName('ounit-test');
    var found = false;
    var foundCurrent = false;
    var idx = 0;
    if (div) {
      for (; !found && idx < div.length; idx++) {
        if (foundCurrent && div[idx].style.display != 'none') {
          found = true;
        };
        if (div[idx].id == "ounit-current") {
          foundCurrent = true;
        };
      };
      if (!foundCurrent && div.length > 0) {
        setTestCurrent(div[0]);
      } else if (found) {
        setTestCurrent(div[idx - 1]);
      } else {
        resetTestCurrent();
      };
    };
  };

  function gotoTop() {
    window.scrollTo(0,0);
    resetTestCurrent();
  };
|};;
