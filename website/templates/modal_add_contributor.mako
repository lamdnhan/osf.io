<div class="modal fade" id="addContributors">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 data-bind="text:pageTitle"></h3>
            </div>

            <div class="modal-body">

                <!-- Whom to add -->

                <div data-bind="if:page()=='whom'">

                    <!-- Find contributors -->
                    <form>
                        <div class="row">
                            <div class="col-md-6">
                                <input style="margin-bottom: 8px;" data-bind="value:query" />
                                <div><button class="btn btn-default" data-bind="click:search">Search</button></div>
                            </div>
                            <div class="col-md-6" data-bind="if:parentId">
                                <a data-bind="click:importFromParent, text:'Import contributors from ' + parentTitle"></a>
                            </div>
                        </div>
                    </form>

                    <hr />

                    <!-- Choose which to add -->
                    <div class="row">

                        <div class="col-md-6"col-md->
                            <div>
                                <span class="modal-subheader">Results</span>
                                <a data-bind="click:addAll">Add all</a>
                            </div>
                            <div class="error" data-bind="if:errorMsg, text:errorMsg"></div>
                            <table>
                                <tbody data-bind="foreach:{data:results, afterRender:addTips}">
                                    <tr data-bind="if:!($root.selected($data))">
                                        <td style="padding-right: 10px;">
                                            <a
                                                    class="btn btn-default contrib-button"
                                                    data-bind="click:$root.add"
                                                    rel="tooltip"
                                                    title="Add contributor"
                                                >+</a>
                                        </td>
                                        <td>
                                            <img data-bind="attr:{src:gravatar}" />
                                        </td>
                                        <td data-bind="text:fullname"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="col-md-6">
                            <div>
                                <span class="modal-subheader">Adding</span>
                                <a data-bind="click:removeAll">Remove all</a>
                            </div>
                            <table>
                                <tbody data-bind="foreach:{data:selection, afterRender:addTips}">
                                    <tr>
                                        <td style="padding-right: 10px;">
                                            <a
                                                    class="btn btn-default contrib-button"
                                                    data-bind="click:$root.remove"
                                                    rel="tooltip"
                                                    title="Remove contributor"
                                                >-</a>
                                        </td>
                                        <td>
                                            <img data-bind="attr:{src:gravatar}" />
                                        </td>
                                        <td data-bind="text:fullname"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>

                <div data-bind="if:page()=='which'">

                    <div>
                        Adding contributor(s)
                        <span data-bind="text:addingSummary()"></span>
                        to component
                        <span data-bind="text:title"></span>.
                    </div>

                    <hr />

                    <div style="margin-bottom:10px;">
                        Would you like to add these contributor(s) to any children of
                        the current component?
                    </div>

                    <div class="row">

                        <div class="col-md-6">
                            <input type="checkbox" checked disabled />
                            <span data-bind="text:title"></span> (current component)
                            <div data-bind="foreach:nodes">
                                <div data-bind="style:{'margin-left':margin}">
                                    <input type="checkbox" data-bind="checked:$parent.nodesToChange, value:id" />
                                    <span data-bind="text:title"></span>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div>
                                <a data-bind="click:selectNodes, css:{disabled:cantSelectNodes()}">Select all</a>
                            </div>
                            <div>
                                <a data-bind="click:deselectNodes, css:{disabled:cantDeselectNodes()}">De-select all</a>
                            </div>
                        </div>

                    </div>

                </div>

            </div><!-- end modal-body -->

            <div class="modal-footer">

                <a href="#" class="btn btn-default" data-dismiss="modal">Cancel</a>

                <span data-bind="if:selection().length && page() == 'whom'">
                    <a class="btn btn-success" data-bind="visible:nodes().length==0, click:submit">Submit</a>
                    <a class="btn btn-primary" data-bind="visible:nodes().length, click:selectWhich">Next</a>
                </span>

                <span data-bind="if:page() == 'which'">
                    <a class="btn btn-primary" data-bind="click:selectWhom">Back</a>
                    <a class="btn btn-success" data-bind="click:submit">Submit</a>
                </span>

            </div><!-- end modal-footer -->
        </div><!-- end modal-content -->
    </div><!-- end modal-dialog -->
</div><!-- end modal -->
