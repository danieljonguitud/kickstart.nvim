# Define the source and target directories
CONFIG_DIR := $(HOME)/.config
TARGET_DIR := $(HOME)

# Define the list of files to symlink and their respective source locations
YABAI_SOURCE := $(CONFIG_DIR)/nvim/yabairc
SKHD_SOURCE := $(CONFIG_DIR)/nvim/skhdrc
WEZTERM_SOURCE := $(CONFIG_DIR)/.wezterm.lua

# Define the target locations for each config file
YABAI_TARGET := $(CONFIG_DIR)/yabai/yabairc
SKHD_TARGET := $(CONFIG_DIR)/skhd/skhdrc
WEZTERM_TARGET := $(TARGET_DIR)/.wezterm.lua

# Default target
.PHONY: all
all: symlinks

# Create symlinks for each config file
.PHONY: symlinks
symlinks: symlink-yabairc symlink-skhdrc symlink-wezterm

# Specific rules to create symlink for each file
.PHONY: symlink-yabairc
symlink-yabairc: $(CONFIG_DIR)/yabai
	@echo "Creating symlink for yabairc"
	@ln -sf $(YABAI_SOURCE) $(YABAI_TARGET)

.PHONY: symlink-skhdrc
symlink-skhdrc: $(CONFIG_DIR)/skhd
	@echo "Creating symlink for skhdrc"
	@ln -sf $(SKHD_SOURCE) $(SKHD_TARGET)

.PHONY: symlink-wezterm
symlink-wezterm:
	@echo "Creating symlink for .wezterm.lua"
	@ln -sf $(WEZTERM_SOURCE) $(WEZTERM_TARGET)

# Ensure target directories exist
$(CONFIG_DIR)/yabai:
	@mkdir -p $(CONFIG_DIR)/yabai

$(CONFIG_DIR)/skhd:
	@mkdir -p $(CONFIG_DIR)/skhd

# Clean symlinks (does not remove the original config files)
.PHONY: clean
clean:
	@echo "Removing symlinks..."
	@rm -f $(YABAI_TARGET) $(SKHD_TARGET) $(WEZTERM_TARGET)

# Install configuration (create symlinks)
.PHONY: install
install: symlinks
	@echo "Configuration installed!"

# Uninstall configuration (remove symlinks)
.PHONY: uninstall
uninstall: clean
	@echo "Configuration uninstalled!"
