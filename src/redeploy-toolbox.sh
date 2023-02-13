#!/bin/sh
# ***************************************************************************************
# Script to redeploy shinyproxy stack using toolbox image
#
#     The src folder must exist from prior stack deployment, 
#     otherwise see DEPLOY.md for complete deployment instructions
#
# ***************************************************************************************
#
# Change directory
cd /opt/docker/landscapedatacommons/toolbox
# Create volumes (except mysql)
# Build image
docker build --no-cache -t landscapedatacommons/toolbox:2.6.1 .
# Push image
docker push landscapedatacommons/toolbox:2.6.1
# Deploy stack using shinyproxy as stack name
TOOLBOX_DOMAIN=toolbox.jornada-stack.nmsu.edu docker stack deploy -c toolbox.yml shinyproxy
#
# ***************************************************************************************
#  Output instructions to test deployed website
echo "Landscape Toolbox tools should now be available at
  1. Balanced Design Tool: https://www.landscapetoolbox.org/balanced-design-tool
  2. Benchmark Exploration Tool: https://www.landscapetoolbox.org/benchmark-exploration-tool
  3. Terradactyl Tool: https://www.landscapetoolbox.org/rangeland-indicator-calculator"