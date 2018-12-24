# copy/pasted from another git repo (don't remember the one)
# please let me know if you recognize so i can apply licence terms
local -A icons=(
  LEFT_SEGMENT_SEPARATOR         $'\uE0B0'              # 
  RIGHT_SEGMENT_SEPARATOR        $'\uE0B2'              # 
  LEFT_SEGMENT_END_SEPARATOR     ' '                    # Whitespace
  LEFT_SUBSEGMENT_SEPARATOR      $'\uE0B1'              # 
  RIGHT_SUBSEGMENT_SEPARATOR     $'\uE0B3'              # 
  CARRIAGE_RETURN_ICON           $'\u21B5'              # ↵
  ROOT_ICON                      $'\uF201'              # 
  SUDO_ICON                      $'\uF09C'              # 
  RUBY_ICON                      $'\uF219 '             # 
  AWS_ICON                       $'\uF270'              # 
  AWS_EB_ICON                    $'\U1F331 '            # 🌱
  BACKGROUND_JOBS_ICON           $'\uF013 '             # 
  TEST_ICON                      $'\uF291'              # 
  TODO_ICON                      $'\u2611'              # ☑
  BATTERY_ICON                   $'\U1F50B'             # 🔋
  DISK_ICON                      $'\uF0A0 '             # 
  OK_ICON                        $'\u2714'              # ✔
  FAIL_ICON                      $'\u2718'              # ✘
  SYMFONY_ICON                   'SF'
  NODE_ICON                      $'\u2B22'              # ⬢
  MULTILINE_FIRST_PROMPT_PREFIX  $'\u256D'$'\U2500'     # ╭─
  MULTILINE_NEWLINE_PROMPT_PREFIX  $'\u251C'$'\U2500'   # ├─
  MULTILINE_LAST_PROMPT_PREFIX   $'\u2570'$'\U2500 '    # ╰─
  APPLE_ICON                     $'\uF179'              # 
  WINDOWS_ICON                   $'\uF17A'              # 
  FREEBSD_ICON                   $'\U1F608 '            # 😈
  ANDROID_ICON                   $'\uE17B'              # 
  LINUX_ICON                     $'\uF17C'              # 
  LINUX_ARCH_ICON                $'\uF17C'              # 
  LINUX_DEBIAN_ICON              $'\uF17C'              # 
  LINUX_UBUNTU_ICON              $'\uF17C'              # 
  LINUX_CENTOS_ICON              $'\uF17C'              # 
  LINUX_COREOS_ICON              $'\uF17C'              # 
  LINUX_ELEMENTARY_ICON          $'\uF17C'              # 
  LINUX_MINT_ICON                $'\uF17C'              # 
  LINUX_FEDORA_ICON              $'\uF17C'              # 
  LINUX_GENTOO_ICON              $'\uF17C'              # 
  LINUX_MAGEIA_ICON              $'\uF17C'              # 
  LINUX_NIXOS_ICON               $'\uF17C'              # 
  LINUX_MANJARO_ICON             $'\uF17C'              # 
  LINUX_DEVUAN_ICON              $'\uF17C'              # 
  LINUX_ALPINE_ICON              $'\uF17C'              # 
  LINUX_AOSC_ICON                $'\uF17C'              # 
  LINUX_OPENSUSE_ICON            $'\uF17C'              # 
  LINUX_SABAYON_ICON             $'\uF17C'              # 
  LINUX_SLACKWARE_ICON           $'\uF17C'              # 
  SUNOS_ICON                     $'\uF185 '             # 
  HOME_ICON                      $'\uF015'              # 
  HOME_SUB_ICON                  $'\uF07C'              # 
  FOLDER_ICON                    $'\uF115'              # 
  ETC_ICON                       $'\uF013 '             # 
  NETWORK_ICON                   $'\uF09E'              # 
  LOAD_ICON                      $'\uF080 '             # 
  SWAP_ICON                      $'\uF0E4'              # 
  RAM_ICON                       $'\uF0E4'              # 
  SERVER_ICON                    $'\uF233'              # 
  VCS_UNTRACKED_ICON             $'\uF059'              # 
  VCS_UNSTAGED_ICON              $'\uF06A'              # 
  VCS_STAGED_ICON                $'\uF055'              # 
  VCS_STASH_ICON                 $'\uF01C '             # 
  VCS_INCOMING_CHANGES_ICON      $'\uF01A '             # 
  VCS_OUTGOING_CHANGES_ICON      $'\uF01B '             # 
  VCS_TAG_ICON                   $'\uF217 '             # 
  VCS_BOOKMARK_ICON              $'\uF27B'              # 
  VCS_COMMIT_ICON                $'\uF221 '             # 
  VCS_BRANCH_ICON                $'\uF126 '             # 
  VCS_REMOTE_BRANCH_ICON         $'\u2192'              # →
  VCS_GIT_ICON                   $'\uF1D3 '             # 
  VCS_GIT_GITHUB_ICON            $'\uF113 '             # 
  VCS_GIT_BITBUCKET_ICON         $'\uF171 '             # 
  VCS_GIT_GITLAB_ICON            $'\uF296 '             # 
  VCS_HG_ICON                    $'\uF0C3 '             # 
  VCS_SVN_ICON                   '(svn) '
  RUST_ICON                      $'\uE6A8'              # 
  PYTHON_ICON                    $'\ue63c'             # 
  SWIFT_ICON                     ''
  GO_ICON                        ''
  PUBLIC_IP_ICON                 ''
  LOCK_ICON                      $'\UF023'              # 
  EXECUTION_TIME_ICON            $'\uF253'
  SSH_ICON                       '(ssh)'
  VPN_ICON                       $'\uF023'
  KUBERNETES_ICON                $'\U2388'              # ⎈
  DROPBOX_ICON                   $'\UF16B'              # 
  DATE_ICON                      $'\uF073 '             # 
  TIME_ICON                      $'\uF017 '             # 
  JAVA_ICON                      $'\U2615'              # ☕︎
  LARAVEL_ICON                   ''
)

breadcrumb/colored () {
    # arguments should be a list of pairs with this format
    # fg/bg message
    #
    # example
    #
    #    white/black "this comes first" black/white "second one"
    #
    # so inside the while loop:
    # $1 = current colors (fg/bg, read fg on bg) so
    # $1:h = Foreground
    # $1:t = Background
    # $2 = text
    # $3 = next color (shift 2 at the end of the loop)

    while (( $# )) {
        it+="%F{$1:h}%K{$1:t}$2%F{$1:t}"
        if (( $# > 3 )) { it+="%K{$3:t}$icons[LEFT_SEGMENT_SEPARATOR]"     }\
        else            { it+="%k%F{$1:t}$icons[LEFT_SEGMENT_SEPARATOR]%f" }
        shift 2
    }

}

export BREADCRUMB_FMT='\e[7m${(j: '$icons[LEFT_SUBSEGMENT_SEPARATOR]' :)@} \e[0m\uE0B0'
breadcrumb () print -- ${(%e)BREADCRUMB_FMT}
    #print -P "\e[7m${(pj: $icons[LEFT_SUBSEGMENT_SEPARATOR] :)@} \e[0m\uE0B0"
