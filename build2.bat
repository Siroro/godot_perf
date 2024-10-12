scons platform=windows use_llvm=yes target=editor -j23 module_mono_enabled=yes precision=double debug_symbols=true
cd bin
godot.windows.editor.double.x86_64.llvm.mono.exe --headless --generate-mono-glue modules/mono/glue
cd ..
python ./modules/mono/build_scripts/build_assemblies.py --godot-output-dir ./bin --push-nupkgs-local D:\nuget --precision=double

scons platform=windows use_llvm=yes target=template_release -j23 module_mono_enabled=yes precision=double debug_symbols=true
scons platform=windows use_llvm=yes target=template_debug -j23 module_mono_enabled=yes precision=double debug_symbols=true
