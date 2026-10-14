set -e

# obtain express schema
schema_file=$(mktemp)
curl -fL https://raw.githubusercontent.com/buildingSMART/Standards-builds/main/IFC/DEV/IFC4_3/HTML/IFC4X3_ADD2_DEV_20260526.exp -o "$schema_file"

# extract schema identifier
schema_identifier=$(head "$schema_file" | grep "SCHEMA " | cut -c 8-  | rev | cut -c 2- | rev)

# if not already available, perform express rule code generation
if [ ! -f $schema_identifier.py ]; then
cp "$schema_file" $schema_identifier.exp
python -m ifcopenshell.express.rule_compiler $schema_identifier.exp $schema_identifier.py
fi

# clean up
rm -f "$schema_file"

# update example models to newest schema identifier 
find models -name '*.ifc' -exec perl -pi -e "s/(?<=FILE_SCHEMA\(\(')IFC\w+/$schema_identifier/" {} \;
find models -name '*.ifc' -exec perl -pi -e "s/(?<=FILE_SCHEMA \(\(')IFC\w+/$schema_identifier/" {} \;

# validate models
find models -name '*.ifc' -print0 | xargs -0 -n1 python -m ifcopenshell.validate --rules --json

python test/alignment_tests.py $schema_identifier
