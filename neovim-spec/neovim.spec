Name:           neovim
Version:        0.11.4
Release:        1%{?dist}
Summary:        Neovim editor (prebuilt files layout)
Epoch:		1

License:        Apache-2.0 AND Vim
URL:            https://github.com/neovim/neovim
Source0:        %{name}-%{version}.tar.gz

%description
Vim is a powerful text editor with a big community that is constantly growing. Even though the editor is about two decades old, people still extend and want to improve it, mostly using Vimscript or one of the supported scripting languages.

%define debug_package %{nil}

%prep
# Unpack into a directory named exactly "neovim"
%setup -q -n nvim-linux-x86_64

%build
:

%install
rm -rf %{buildroot}

# Create target directories
install -d "%{buildroot}%{_prefix}/local/bin" \
           "%{buildroot}%{_prefix}/local/lib" \
           "%{buildroot}%{_prefix}/local/share"

# Copy payload from the provided layout (we're in the extracted "neovim/" tree)
# Preserve permissions and symlinks; tolerate empty dirs.
if [ -d "bin" ]; then
  cp -a bin/. "%{buildroot}%{_prefix}/local/bin/" 2>/dev/null || :
fi
if [ -d "lib" ]; then
  cp -a lib/. "%{buildroot}%{_prefix}/local/lib/" 2>/dev/null || :
fi
if [ -d "share" ]; then
  cp -a share/. "%{buildroot}%{_prefix}/local/share/" 2>/dev/null || :
fi

# Generate a file manifest so we don't have to hardcode file names
# Own the three top-level dirs explicitly, and include all nested dirs/files.
cat > filelist <<'EOF'
%dir %{_prefix}/local/bin
%dir %{_prefix}/local/lib
%dir %{_prefix}/local/share
EOF

# Include all created subdirectories as %dir
find "%{buildroot}%{_prefix}/local/bin" -type d -mindepth 1 -print 2>/dev/null \
  | sed -e 's|^%{buildroot}||' -e 's|^|%dir |' >> filelist || :
find "%{buildroot}%{_prefix}/local/lib" -type d -mindepth 1 -print 2>/dev/null \
  | sed -e 's|^%{buildroot}||' -e 's|^|%dir |' >> filelist || :
find "%{buildroot}%{_prefix}/local/share" -type d -mindepth 1 -print 2>/dev/null \
  | sed -e 's|^%{buildroot}||' -e 's|^|%dir |' >> filelist || :

# Include all files and symlinks
find "%{buildroot}%{_prefix}/local/bin" -mindepth 1 \( -type f -o -type l \) -print 2>/dev/null \
  | sed -e 's|^%{buildroot}||' >> filelist || :
find "%{buildroot}%{_prefix}/local/lib" -mindepth 1 \( -type f -o -type l \) -print 2>/dev/null \
  | sed -e 's|^%{buildroot}||' >> filelist || :
find "%{buildroot}%{_prefix}/local/share" -mindepth 1 \( -type f -o -type l \) -print 2>/dev/null \
  | sed -e 's|^%{buildroot}||' >> filelist || :

%files -f filelist

%changelog
* Mon Oct 20 2025 Nick Dandoulakis <nick.dan@ed.ac.uk> - 0.11.4-1
- Package prebuilt neovim 

