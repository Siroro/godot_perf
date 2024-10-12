REM scons platform=windows use_llvm=yes target=editor -j23 module_mono_enabled=yes module_godot_tracy_enabled=true debug_symbols=true vsproj=yes
scons platform=windows use_llvm=yes target=editor -j23 module_mono_enabled=yes module_godot_tracy_enabled=true debug_symbols=true 

bin\godot.windows.editor.x86_64.llvm.mono.exe --headless --generate-mono-glue modules/mono/glue

python ./modules/mono/build_scripts/build_assemblies.py --godot-output-dir ./bin --godot-platform=windows --push-nupkgs-local D:\nuget 

scons platform=windows use_llvm=yes target=template_release -j23 module_mono_enabled=yes debug_symbols=true module_godot_tracy_enabled=true 
scons platform=windows use_llvm=yes target=template_debug -j23 module_mono_enabled=yes debug_symbols=true module_godot_tracy_enabled=true 