# -*- coding: utf-8 -*-

"""
***************************************************************************
    CreateNewModelAction.py
    ---------------------
    Date                 : August 2012
    Copyright            : (C) 2012 by Victor Olaya
    Email                : volayaf at gmail dot com
***************************************************************************
*                                                                         *
*   This program is free software; you can redistribute it and/or modify  *
*   it under the terms of the GNU General Public License as published by  *
*   the Free Software Foundation; either version 2 of the License, or     *
*   (at your option) any later version.                                   *
*                                                                         *
***************************************************************************
"""

__author__ = 'Victor Olaya'
__date__ = 'August 2012'
__copyright__ = '(C) 2012, Victor Olaya'

# This will get replaced with a git SHA1 when you do a git archive

__revision__ = '$Format:%H$'

import os

from qgis.core import QgsApplication

from processing.gui.ToolboxAction import ToolboxAction
from processing.modeler.ModelerDialog import ModelerDialog

pluginPath = os.path.split(os.path.dirname(__file__))[0]


class CreateNewModelAction(ToolboxAction):

    def __init__(self):
        self.name, self.i18n_name = self.trAction('Create new model')
        self.group, self.i18n_group = self.trAction('Tools')

    def getIcon(self):
        return QgsApplication.getThemeIcon("/processingModel.svg")

    def execute(self):
        dlg = ModelerDialog()
        dlg.update_model.connect(self.updateModel)
        dlg.show()

    def updateModel(self):
        QgsApplication.processingRegistry().providerById('model').refreshAlgorithms()
