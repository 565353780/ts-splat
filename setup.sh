cd ..
git clone --depth 1 https://github.com/bohanwang/libpgo.git
git clone --depth 1 https://github.com/gmh14/TetWild.git
git clone --depth 1 https://github.com/NVlabs/nvdiffrast.git
git clone --depth 1 --recursive git@github.com:NVlabs/tiny-cuda-nn.git

conda install -c conda-forge gmp mpfr imath -y
conda install tbb tbb-devel mkl mkl-devel -y

pip install ninja pybind11

pip3 install torch torchvision torchaudio \
  --index-url https://download.pytorch.org/whl/cu124

pip install scikit-build

pip install trimesh xatlas omegaconf opencv-python \
  matplotlib tqdm mitsuba pymeshlab PyMCubes gurobipy

cd libpgo
python setup.py install

cd ../TetWild
mkdir build
cd build
cmake ..
make -j

cd ../../nvdiffrast
python setup.py install

cd ../tiny-cuda-nn/bindings/torch
python setup.py install

cd ../../../ts-splat/tssplat_ext
python setup.py install
