#!/bin/bash
source setup.sh; # load the config & library functions

own_plugins() {
    cd ${HTML_PATH}
    if [ -f .git/config ]
    then
        echo "Git already initialised"
    else
        echo "Git isn't initialised"
        git init
    fi

    git submodule add git@github.com:sharpchi/moodle-tool_modedit.git admin/tool/modedit
    git submodule add git@github.com:chiuni/tool_rollover.git admin/tool/rollover

    git submodule add git@github.com:sharpchi/moodle-block_coursesearch.git blocks/coursesearch
    git submodule add git@github.com:chiuni/moodle-block_intranetnews.git blocks/intranetnews
    git submodule add git@github.com:sharpchi/moodle-block_libanswers.git blocks/libanswers
    git submodule add git@github.com:chiuni/moodle-block_minimumstandards.git blocks/minimumstandards

    git submodule add git@github.com:chiuni/moodle-enrol_sits.git enrol/sits

    git submodule add git@github.com:sharpchi/moodle-filter_syntaxhighlighter.git filter/syntaxhighlighter
    git submodule add git@github.com:chiuni/moodle-filter_thefeed.git filter/thefeed

    git submodule add git@github.com:sharpchi/moodle-atto_linkadv.git lib/editor/atto/plugins/linkadv
    git submodule add git@github.com:sharpchi/moodle-atto_templates4u.git lib/editor/atto/plugins/templates4u

    git submodule add git@github.com:sharpchi/moodle-local_accessibilitytool.git local/accessibilitytool
    git submodule add git@github.com:sharpchi/moodle-adminsettingsconfig.git local/adminsettingsconfig
    git submodule add git@github.com:chiuni/moodle-local_chi.git local/chi
    git submodule add git@github.com:chiuni/moodle-local_communications.git local/communications
    git submodule add git@github.com:sharpchi/moodle-local_enrolmentwatcher.git local/enrolmentwatcher
    git submodule add git@github.com:chiuni/moodle-local_placeholders.git local/placeholders

    git submodule add git@github.com:sharpchi/moodle-mod_evalutation.git mod/evaluation
    git submodule add git@github.com:chiuni/moodle-mod_handbook.git mod/handbook

    git submodule add git@github.com:chiuni/moodle-report_interlibraryloans.git report/interlibraryloans
    git submodule add git@github.com:chiuni/moodle-report_stickers.git report/stickers
    git submodule add git@github.com:chiuni/moodle-report_servermonitor.git report/servermonitor

    git submodule add git@github.com:chiuni/moodle-theme_chi.git theme/chi
}
third_plugins () {
    cd ${HTML_PATH}
    if [ -f .git/config ]
    then
        echo "Git already initialised"
    else
        echo "Git isn't initialised"
        git init
    fi

    MIG="${MOODLEMIGRATION_PATH}/moodle/htdocs"

    rsync -avz "${MIG}/admin/tool/editrolesbycap/" "${HTML_PATH}/admin/tool/editrolesbycap/"
    rsync -avz "${MIG}/admin/tool/migratehvp2h5p/" "${HTML_PATH}/admin/tool/migratehvp2h5p/"

    rsync -avz "${MIG}/auth/oidc/" "${HTML_PATH}/auth/oidc/"
    rsync -avz "${MIG}/auth/saml2/" "${HTML_PATH}/auth/saml2/"

    rsync -avz "${MIG}/blocks/admin_presets/" "${HTML_PATH}/blocks/admin_presets/"
    rsync -avz "${MIG}/blocks/checklist/" "${HTML_PATH}/blocks/checklist/"
    rsync -avz "${MIG}/blocks/completion_progress/" "${HTML_PATH}/blocks/completion_progress/"
    rsync -avz "${MIG}/blocks/heatmap/" "${HTML_PATH}/blocks/heatmap/"
    rsync -avz "${MIG}/blocks/microsoft/" "${HTML_PATH}/blocks/microsoft/"
    rsync -avz "${MIG}/blocks/multiblock/" "${HTML_PATH}/blocks/multiblock/"
    rsync -avz "${MIG}/blocks/panopto/" "${HTML_PATH}/blocks/panopto/"

    rsync -avz "${MIG}/course/format/flexible/" "${HTML_PATH}/course/format/flexible/"
    rsync -avz "${MIG}/course/format/grid/" "${HTML_PATH}/course/format/grid/"

    rsync -avz "${MIG}/files/converter/onedrive/" "${HTML_PATH}/files/converter/onedrive/"

    rsync -avz "${MIG}/filter/estreamauth/" "${HTML_PATH}/filter/estreamauth/"
    rsync -avz "${MIG}/filter/generico/" "${HTML_PATH}/filter/generico/"
    rsync -avz "${MIG}/filter/oembed/" "${HTML_PATH}/filter/oembed/"
    rsync -avz "${MIG}/filter/planetestream/" "${HTML_PATH}/filter/planetestream/"
    rsync -avz "${MIG}/filter/shortcodes/" "${HTML_PATH}/filter/shortcodes/"

    rsync -avz "${MIG}/lib/editor/atto/plugins/fullscreen/" "${HTML_PATH}/lib/editor/atto/plugins/fullscreen/"
    rsync -avz "${MIG}/lib/editor/atto/plugins/generico/" "${HTML_PATH}/lib/editor/atto/plugins/generico/"
    rsync -avz "${MIG}/lib/editor/atto/plugins/hr/" "${HTML_PATH}/lib/editor/atto/plugins/hr/"
    rsync -avz "${MIG}/lib/editor/atto/plugins/panoptobutton/" "${HTML_PATH}/lib/editor/atto/plugins/panoptobutton/"
    rsync -avz "${MIG}/lib/editor/atto/plugins/planetestream/" "${HTML_PATH}/lib/editor/atto/plugins/planetestream/"
    rsync -avz "${MIG}/lib/editor/atto/plugins/styles/" "${HTML_PATH}/lib/editor/atto/plugins/styles/"
    git submodule add git@github.com:enovation/moodle-atto_teamsmeeting.git lib/editor/atto/plugins/teamsmeeting

    rsync -avz "${MIG}/local/boostnavigation/" "${HTML_PATH}/local/boostnavigation/"
    git submodule add git@github.com:moodlehq/moodle-local_codechecker.git local/codechecker
    rsync -avz "${MIG}/local/metagroups/" "${HTML_PATH}/local/metagroups/"
    git submodule add git@github.com:moodlehq/moodle-local_moodlecheck.git local/moodlecheck
    rsync -avz "${MIG}/local/o365/" "${HTML_PATH}/local/o365/"


    rsync -avz "${MIG}/mod/aspirelists/" "${HTML_PATH}/mod/aspirelists/"
    rsync -avz "${MIG}/mod/assign/feedback/structured/" "${HTML_PATH}/mod/assign/feedback/structured/"
    rsync -avz "${MIG}/mod/assign/submission/estream/" "${HTML_PATH}/mod/assign/submission/estream/"
    rsync -avz "${MIG}/mod/bigbluebuttonbn/" "${HTML_PATH}/mod/bigbluebuttonbn/"
    rsync -avz "${MIG}/mod/book/" "${HTML_PATH}/mod/book/"
    rsync -avz "${MIG}/mod/checklist/" "${HTML_PATH}/mod/checklist/"
    rsync -avz "${MIG}/mod/groupselect/" "${HTML_PATH}/mod/groupselect/"
    rsync -avz "${MIG}/mod/hvp/" "${HTML_PATH}/mod/hvp/"
    rsync -avz "${MIG}/mod/lightboxgallery/" "${HTML_PATH}/mod/lightboxgallery/"
    rsync -avz "${MIG}/mod/panopto/" "${HTML_PATH}/mod/panopto/"
    rsync -avz "${MIG}/mod/peerwork/" "${HTML_PATH}/mod/peerwork/"
    rsync -avz "${MIG}/mod/questionnaire/" "${HTML_PATH}/mod/questionnaire/"
    rsync -avz "${MIG}/mod/scheduler/" "${HTML_PATH}/mod/scheduler/"
    rsync -avz "${MIG}/mod/turnitintooltwo/" "${HTML_PATH}/mod/turnitintooltwo/"

    rsync -avz "${MIG}/pix/" "${HTML_PATH}/pix/"

    rsync -avz "${MIG}/plagiarism/turnitin/" "${HTML_PATH}/plagiarism/turnitin/"

    rsync -avz "${MIG}/question/behaviour/deferredfeedbackexplain/" "${HTML_PATH}/question/behaviour/deferredfeedbackexplain/"
    rsync -avz "${MIG}/question/type/ordering/" "${HTML_PATH}/question/type/ordering/"

    rsync -avz "${MIG}/report/customsql/" "${HTML_PATH}/report/customsql/"
    rsync -avz "${MIG}/report/editdates/" "${HTML_PATH}/report/editdates/"

    rsync -avz "${MIG}/repository/office365/" "${HTML_PATH}/repository/office365/"
    rsync -avz "${MIG}/repository/panopto/" "${HTML_PATH}/repository/panopto/"
    rsync -avz "${MIG}/repository/pixabay/" "${HTML_PATH}/repository/pixabay/"

    rsync -avz "${MIG}/theme/boost_o365teams/" "${HTML_PATH}/theme/boost_o365teams/"
}

own_plugins
third_plugins