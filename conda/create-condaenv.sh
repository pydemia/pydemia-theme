#!/bin/bash

export CONDA_ENV_NM_NEW="accutuning-pipelines-py38"
export PY_VER="3.8"
export BASE_ENVFILE="conda_envfile.yaml"
export PIP_PKG_REQ="requirements.txt"


if ! command -v conda &> /dev/null; then
  printf "'conda' not found. closing..."
  exit 1
else
  printf "'conda' found: $(which conda)\n"
  printf "======================================\n"
  printf "CONDA_ENV_NM_NEW=$CONDA_ENV_NM_NEW\n"
  printf "PY_VER=$PY_VER\n"
  printf "BASE_ENVFILE=$BASE_ENVFILE\n"
  printf "PIP_PKG_REQ=$PIP_PKG_REQ\n"
  printf "======================================\n"
  #   --file "conda_envfile.yaml" \
  if [ -f "$BASE_ENVFILE" ] && [ -f "$PIP_PKG_REQ" ] ; then
    printf "Found: [$BASE_ENVFILE, $PIP_PKG_REQ]\n"
    conda create \
      -n "$CONDA_ENV_NM_NEW" \
      python="$PY_VER" \
      ipykernel -y \
      --file "$BASE_ENVFILE" && \
      source "$(dirname "$(which conda)")/../etc/"profile.d/conda.sh && \
      conda activate "$CONDA_ENV_NM_NEW" && \
      python -m ipykernel install \
        --user \
        --name "$CONDA_ENV_NM_NEW" \
        --display-name "${CONDA_ENV_NM_NEW} (conda env)" && \
      pip install -r "$PIP_PKG_REQ" && \
      conda deactivate
  elif [ -f "$BASE_ENVFILE" ] && [ ! -f "$PIP_PKG_REQ" ] ; then
    printf "Found: [$BASE_ENVFILE]\n"
    conda create \
      -n "$CONDA_ENV_NM_NEW" \
      python="$PY_VER" \
      ipykernel -y \
      --file "$BASE_ENVFILE" && \
      source "$(dirname "$(which conda)")/../etc/"profile.d/conda.sh && \
      conda activate "$CONDA_ENV_NM_NEW" && \
      python -m ipykernel install \
        --user \
        --name "$CONDA_ENV_NM_NEW" \
        --display-name "${CONDA_ENV_NM_NEW} (conda env)" && \
      conda deactivate
  elif [ ! -f "$BASE_ENVFILE" ] && [ -f "$PIP_PKG_REQ" ] ; then
    printf "Found: [$PIP_PKG_REQ]\n"
    conda create \
      -n "$CONDA_ENV_NM_NEW" \
      python="$PY_VER" \
      ipykernel -y && \
      source "$(dirname "$(which conda)")/../etc/"profile.d/conda.sh && \
      conda activate "$CONDA_ENV_NM_NEW" && \
      python -m ipykernel install \
        --user \
        --name "$CONDA_ENV_NM_NEW" \
        --display-name "${CONDA_ENV_NM_NEW} (conda env)" && \
      pip install -r "$PIP_PKG_REQ" && \
      conda deactivate
  else
    conda create \
      -n "$CONDA_ENV_NM_NEW" \
      python="$PY_VER" \
      ipykernel -y && \
      source "$(dirname "$(which conda)")/../etc/"profile.d/conda.sh && \
      conda activate "$CONDA_ENV_NM_NEW" && \
      python -m ipykernel install \
        --user \
        --name "$CONDA_ENV_NM_NEW" \
        --display-name "${CONDA_ENV_NM_NEW} (conda env)" && \
      conda deactivate
  fi
fi