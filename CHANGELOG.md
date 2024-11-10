# Changelog

## 1.0.0 (2024-11-10)


### ⚠ BREAKING CHANGES

* **stars:** make userName reusable
* update home-manager configuration
* **core:** Systems now require setting users.mainUser in their configuration. Update existing configurations to set this value.
* **stars:** Star definitions now require a different structure. Update existing stars to separate metadata and configuration.
* **starry:** Change stars behavior from 'enable' syntax to 'import' syntax

### Features

* add 42 schhol stuff ([d8af0c5](https://github.com/airone01/dotfiles2/commit/d8af0c554422e8382e11806f42372fce4ac641c1))
* add caddy overlay ([595f8b6](https://github.com/airone01/dotfiles2/commit/595f8b6816c881889035a9342c239405f0852ce7))
* add fonts star ([7f094f8](https://github.com/airone01/dotfiles2/commit/7f094f8e17c76073cc75b6f5e9fb3a4002c824fe))
* add orion ([99241d0](https://github.com/airone01/dotfiles2/commit/99241d0c60b480ef89015509e7e4158fbe8248b4))
* **aqua:** add simple caddy config ([b2bb4e6](https://github.com/airone01/dotfiles2/commit/b2bb4e67cf4f4ddeaa5a4823ea850858c2b0fb83))
* **aquarius:** add gh support ([b1b22fe](https://github.com/airone01/dotfiles2/commit/b1b22fed99df485d6ca4091664556773306dc017))
* **asterisms:** implement ([e5d6017](https://github.com/airone01/dotfiles2/commit/e5d6017e9dcded137dc9c36c92853565522580e6))
* **caddy:** add index page ([78e55b6](https://github.com/airone01/dotfiles2/commit/78e55b6798648a335f567eff4bd92edd98e1b8e9))
* **cassiopeia:** add ts lang ([a4ec010](https://github.com/airone01/dotfiles2/commit/a4ec0101200032149df2232b890bd1cdcf863e0d))
* change some flake inner workings ([2abf9a8](https://github.com/airone01/dotfiles2/commit/2abf9a8c7da2b9d56f8c454ab086cab415af28f2))
* **changelog:** implement commitlint ([41b6c3f](https://github.com/airone01/dotfiles2/commit/41b6c3f68ec3d21638a95be63072c3de0541bdfa))
* **core:** implement home-manager for main user ([d38334f](https://github.com/airone01/dotfiles2/commit/d38334ff12ede4ab99a4e1b70d30434ab8f43df5))
* **gh:** implement ([bc82bc9](https://github.com/airone01/dotfiles2/commit/bc82bc960af404210103711ed2fd28a8b2052f58))
* implement modules ([c08927d](https://github.com/airone01/dotfiles2/commit/c08927d6d31ac2eddbeb26fdb84d84ab428030c0))
* implement plymouth, dynamic triple buffering ([6630a0d](https://github.com/airone01/dotfiles2/commit/6630a0daceb5aa10b84186e8c2f1fdd3fc2c9180))
* implement sops-nix ([1624ed6](https://github.com/airone01/dotfiles2/commit/1624ed6bfbf27332b15c5daaa9016ba3e42fbdc2))
* initial commit ([f123315](https://github.com/airone01/dotfiles2/commit/f123315862a23830b24088c757eb3912c7eb38ca))
* **nvf:** add multiple plugins ([0bc89f4](https://github.com/airone01/dotfiles2/commit/0bc89f44658f1d97c03d579d7989bc680e3f4468))
* **nvf:** add multiple plugins ([f880c09](https://github.com/airone01/dotfiles2/commit/f880c09c6290a5d71c934ec6a411f9f064fb1aa0))
* **nvf:** add some config and some lsp ([d2bb205](https://github.com/airone01/dotfiles2/commit/d2bb205b3be612594d000bfb201e1069bcebd0e0))
* **nvf:** implement most lsp features ([89e611b](https://github.com/airone01/dotfiles2/commit/89e611b1d2952d310dffafb8769fcc811e5b0b9c))
* **nvf:** implement on orion ([d436b50](https://github.com/airone01/dotfiles2/commit/d436b50a7adb6dabfd8ea60cab464ff02cc640ba))
* **nvf:** implement some plugins ([2b9d889](https://github.com/airone01/dotfiles2/commit/2b9d8896eb7d4d66d4ea75afd5b94c540dd8435b))
* **orion/nvim:** implement nvf ([d168499](https://github.com/airone01/dotfiles2/commit/d16849974c24cfd2da3e2929c950c42d73470cac))
* **orion:** add vmware guest addition ([22e5501](https://github.com/airone01/dotfiles2/commit/22e55010ba28732a35234bfdef3ce91bc0c5d3b7))
* **orion:** implement gdm and gnome ([a733cd7](https://github.com/airone01/dotfiles2/commit/a733cd70452921d061a7bd83d432c34306b72b5e))
* **orion:** merge pr [#5](https://github.com/airone01/dotfiles2/issues/5) ([a8c63e6](https://github.com/airone01/dotfiles2/commit/a8c63e631d9c025933e172809a6472984f9ed66f))
* **plymouth:** apply catppuccin-mocha theme ([5088ba0](https://github.com/airone01/dotfiles2/commit/5088ba0ac395f115993b964c80afc0462b68d06b))
* **schizofox:** implement ([4e5f9c7](https://github.com/airone01/dotfiles2/commit/4e5f9c7c7b67c20c644c120678c5944de17a13f8))
* **stars/code/garnix:** implement ([197169e](https://github.com/airone01/dotfiles2/commit/197169ebde7f5b765fb473dba000c97b4ba07709))
* **stars/core:** add some core functionalities ([4cef56e](https://github.com/airone01/dotfiles2/commit/4cef56ef2ec6f4476ea2119a3ebeb29f5b0aee56))
* **stars:** enhance star import system and add documentation ([4921bb0](https://github.com/airone01/dotfiles2/commit/4921bb0708001c71567019cc576a0f09b77b8bec))


### Bug Fixes

* a bunch of stuff ([c07cd7c](https://github.com/airone01/dotfiles2/commit/c07cd7cdc597bd08c8b07645bd0733d7f90ec6c9))
* add firefox and disable schizofox ([a24a5ca](https://github.com/airone01/dotfiles2/commit/a24a5cac674c793d7cc58872ca2a47daa11fb586))
* **caddy:** aaaaaaaaa ([7fd7511](https://github.com/airone01/dotfiles2/commit/7fd7511b4a1a24f15bae3d81d78dfba703333f4f))
* **caddy:** disable everything ([765f41b](https://github.com/airone01/dotfiles2/commit/765f41ba69302ef4aed8c96b8dfb91cef8ded3c3))
* **caddy:** disable l4 module ([63720df](https://github.com/airone01/dotfiles2/commit/63720df256927338507d577a17021204310f5273))
* **caddy:** hacky solution before pr merge ([141ea70](https://github.com/airone01/dotfiles2/commit/141ea708269b9656c3f105fb5fd2ef59154aaa4f))
* **caddy:** handle doule quotes in response ([c931025](https://github.com/airone01/dotfiles2/commit/c931025f9acf66c4d044064ab1a0fb2302c3d243))
* **caddy:** it should work now buyt it doest ([b13bd04](https://github.com/airone01/dotfiles2/commit/b13bd04006d8c3e653d5bca72094f11f81884400))
* **caddy:** move acmw_dns to global dns ([6a10005](https://github.com/airone01/dotfiles2/commit/6a100055d73bfef5be08c247235b6f3ec8edc731))
* **caddy:** move overlay out of star ([67aab6b](https://github.com/airone01/dotfiles2/commit/67aab6be9b8b642026df355227955c31c4b1005f))
* **caddy:** move tls def ([33074d6](https://github.com/airone01/dotfiles2/commit/33074d678ca1c959e72b5600fad1d16c0424e1a7))
* **caddy:** move tls to site definition ([68db561](https://github.com/airone01/dotfiles2/commit/68db5616a5c90ff24c931333c508526ed7aaa3cf))
* **caddy:** read file instead of file_server ([f25223e](https://github.com/airone01/dotfiles2/commit/f25223ee8eb47f818af1f9e9c4cc1679bbe726cb))
* **caddy:** remove overlayand use flake instead ([360f410](https://github.com/airone01/dotfiles2/commit/360f4100f5a618acc2788100a0a393376049a8af))
* **caddy:** try to pass cloudflare in site config ([ce07b97](https://github.com/airone01/dotfiles2/commit/ce07b970e4434c524b2d09401da921ece519d6a1))
* **caddy:** update sha256 ([d063474](https://github.com/airone01/dotfiles2/commit/d0634746e896b43cef54289cbc81d511af745b8b))
* **caddy:** use override to pass env var ([75f5aa4](https://github.com/airone01/dotfiles2/commit/75f5aa4695775a43d4d169f0935d7bea6d0c369c))
* **cassiopeia:** plymouth and zsh ([031a515](https://github.com/airone01/dotfiles2/commit/031a515f52df19a9a801d0895745c2f6b65b570e))
* **cassiopeia:** re-instore previous fixes ([959e09b](https://github.com/airone01/dotfiles2/commit/959e09b1566988d3fdc88bab75abf4f8a8862d2a))
* **cassiopeia:** remove plymouth ([31c7c32](https://github.com/airone01/dotfiles2/commit/31c7c32615b31b1f6f038896dc8b1f39992b4055))
* **default:** rename to cassiopeia ([9535dff](https://github.com/airone01/dotfiles2/commit/9535dffd80d05c400b15742ef6dcba2830c786e8))
* figure out `system` ([968a5de](https://github.com/airone01/dotfiles2/commit/968a5de8bb35a8e06fc415ddcf7076158cc1cfe8))
* **flake.nix:** simplify ([29cc18b](https://github.com/airone01/dotfiles2/commit/29cc18beed5fc6bbfb8efed701a40f83d46b0e22))
* **flake:** come back to teh basics with commitlint ([5507e56](https://github.com/airone01/dotfiles2/commit/5507e56a52ddbf69e61023adf2146ee7992e923d))
* **gnome:** change some deps ([31563c9](https://github.com/airone01/dotfiles2/commit/31563c974562074a5ef644a8a020294a1e853409))
* **gnome:** patch extensions maybe ([ef36e7f](https://github.com/airone01/dotfiles2/commit/ef36e7f6cc3523ecbe42a6e0066d3e890e9e8200))
* **home-manager:** move package deps to user ([f34950b](https://github.com/airone01/dotfiles2/commit/f34950beb5a8d67aa05b20e0622156ecfc363472))
* **home-manager:** patch backup extension ([8425ff4](https://github.com/airone01/dotfiles2/commit/8425ff491ba5b294e9507a0c0362cad550f5f594))
* **modules:** move most to stars ([8bf5393](https://github.com/airone01/dotfiles2/commit/8bf5393a284315b45f18c4626f4fafa1a37c5873))
* **nixpkgs:** patch useless pkgs redeclaration ([fea7541](https://github.com/airone01/dotfiles2/commit/fea7541e0841304f8261b61cfdf486239341fc62))
* **nvf:** patch module config ([15a59a1](https://github.com/airone01/dotfiles2/commit/15a59a166cb91693d4f33bd158bd2088201c651c))
* **orion/gh:** make it system-wide ([18192f6](https://github.com/airone01/dotfiles2/commit/18192f6a67e02262a769e0cd2ad034bde785bd00))
* **orion/git:** patch git identity ([4c3200b](https://github.com/airone01/dotfiles2/commit/4c3200b30ba890d71e0150239eb59c3420da5441))
* **orion/tty:** change font ([511c0fc](https://github.com/airone01/dotfiles2/commit/511c0fc3edd9876d1944933ea562bc54d1a9d45f))
* patch zellij ? ([e5317b8](https://github.com/airone01/dotfiles2/commit/e5317b81678ae45eabf7c9b4af8b75ebd815fe60))
* **r1-git:** patch new gh username ([a24ca4e](https://github.com/airone01/dotfiles2/commit/a24ca4e1e61446f823921ec6cd4e36a4049b09fc))
* **sops:** change user of caddy token to "caddy" ([2fa83f5](https://github.com/airone01/dotfiles2/commit/2fa83f584804e360379576768d6b038aca91a9b1))
* **sops:** i think i figured it out ([73b2712](https://github.com/airone01/dotfiles2/commit/73b2712d3f9366be2f70f6bb73f35096744e65a4))
* **sops:** may work now ([f0b4027](https://github.com/airone01/dotfiles2/commit/f0b4027ae3b9438a9a4f10330bca14eac77dda11))
* **sops:** patch cadddy secrets ([07e86ec](https://github.com/airone01/dotfiles2/commit/07e86ec783627101961528f95159656b97bcec9d))
* **sops:** patch caddy secret name ([6febb52](https://github.com/airone01/dotfiles2/commit/6febb52a190ae3f80cbc03cb8518564b4bb348b6))
* **sops:** patch entry file path ([40bfc7a](https://github.com/airone01/dotfiles2/commit/40bfc7a5f50f603e56cedd62d9a590fce46722f5))
* **starry:** change how stars work ([686db62](https://github.com/airone01/dotfiles2/commit/686db62be7bdbf654ebc7014424b0d5de044f202))
* **starry:** enhance home-manager support ([60032be](https://github.com/airone01/dotfiles2/commit/60032be76602edc81515aa7fb553ac3f8b6da84f))
* **stars/core:** disable networking.wireless ([ae0effe](https://github.com/airone01/dotfiles2/commit/ae0effe9ab6a2e5e212f47312f693b7ccbdb8cfd))
* **stars:** moved the last of modules to stars ([6a018a7](https://github.com/airone01/dotfiles2/commit/6a018a7e4981d2346ca433069c99acc22eeb9664))
* **stars:** patch merging of configs ([24ba4ac](https://github.com/airone01/dotfiles2/commit/24ba4ac8c4e66fd11b0c48128fa03539b01071ac))
* transition towards home-made framework ([c5eb34a](https://github.com/airone01/dotfiles2/commit/c5eb34a479ddbc3693e2b640a97a960663870c77))
* update secret for aquarius privat key ([5d6e869](https://github.com/airone01/dotfiles2/commit/5d6e869d5ed0f6a6ba2954e2201a0507cb420bb9))


### Documentation

* **readme:** implement ([1f64a8c](https://github.com/airone01/dotfiles2/commit/1f64a8cc1c37ccafc709a06d6132f37099d07e52))


### Code Refactoring

* garnix ([a9423ea](https://github.com/airone01/dotfiles2/commit/a9423ead24989a35722aea5937899894fd94df65))
* last fixes to starry ([bb14b0d](https://github.com/airone01/dotfiles2/commit/bb14b0da1d002cc2e9de58d8ab4bb44350f28ed1))
* merge pull request [#11](https://github.com/airone01/dotfiles2/issues/11) from airone01/fix/nixos-generators ([2652aba](https://github.com/airone01/dotfiles2/commit/2652abab9df26719aa5a36c1ea1a39999ea0d02a))
* **nvf:** move configs in specific files ([5101d9b](https://github.com/airone01/dotfiles2/commit/5101d9bf3dc266f7ccf82c141d68a08174b86ee5))
* **nvim:** turn into a new star ([89c752f](https://github.com/airone01/dotfiles2/commit/89c752ff2d9a30d0bd3bda2b48002bc6702b6917))
* **r1:** move personal config ([b0b24aa](https://github.com/airone01/dotfiles2/commit/b0b24aa06e4a9b52fecf33734e4762b4c19a29ee))
* **stars:** hyprland ([bf94dd0](https://github.com/airone01/dotfiles2/commit/bf94dd0226e8591833b018da59a925901219cc41))
* **stars:** make userName reusable ([2841306](https://github.com/airone01/dotfiles2/commit/2841306bfe36d99ba1a420854a8f6525fb68b53f))
* **stars:** restructure star system to comply with NixOS modules ([a6836f3](https://github.com/airone01/dotfiles2/commit/a6836f3adf890f32f3d24a7581b438d5639f0296))
* **stars:** restructure stars system and improve configuration ([bc24e98](https://github.com/airone01/dotfiles2/commit/bc24e98b6e886b96786a02687ad51abda65ced36))
* **stars:** upgrade most stars ([808a1ce](https://github.com/airone01/dotfiles2/commit/808a1ce6afaf49e0c3c9d7b2c258429f5e3fbf94))
* update home-manager configuration ([b597536](https://github.com/airone01/dotfiles2/commit/b59753609027db49b6d2e6c64e89d09f0f8cdddc))
* update lock and add a bunch of stuff ([012fede](https://github.com/airone01/dotfiles2/commit/012fede543b92b381c141882158433874e4d06ff))
