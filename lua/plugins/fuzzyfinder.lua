return {
    'camspiers/snap',
    config = function() 
        local snap = require("snap")
        snap.maps {
            { "<Leader><Leader>", snap.config.file { producer = "ripgrep.file" } },
            { "<leader>g",        snap.config.vimgrep({}) },
        }
    end
}
