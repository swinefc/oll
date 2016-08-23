#!/bin/bash

echo Building Student Tar / Archive based on local student account

#tar -czvf /OLL/account_templates/student_template.tgz /Users/student

dscl . -mcxexport /Users/student > /OLL/account_templates/student_mcx.plist
