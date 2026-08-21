# IFC sample models

This repository contains sample models for the Industry Foundation Classes (IFC) specifications.

The examples demonstrate how IFC concepts can be represented in small, focused data sets. They are intended to support implementers, software developers, specification authors, and others learning or testing IFC.

Official IFC publications are available from the [buildingSMART IFC Specifications Database](https://technical.buildingsmart.org/standards/ifc/ifc-schema-specifications/).

> [!IMPORTANT]
> These examples are informative in nature and do not replace the normative specification. Concepts in use in these examples may potentially not adhere to specified schema subsets (model view definitions). For normative use, always refer to the corresponding official buildingSMART publication.

## Sample repository

This repository contains the **sample models for the [`IFC4.3.x-development`](https://github.com/buildingSMART/IFC4.3.x-development) specification**.

Each example focuses on a particular concept or representation pattern. Where available, a nearby `README.md` describes the purpose and structure of the sample. The models are deliberately compact so that the relevant IFC entities and relationships can be inspected in textual form. Some examples also include reference images.

Issues with a sample model may be reported in this repository. Issues and proposed changes concerning the IFC specification itself should be submitted to [`IFC4.3.x-development`](https://github.com/buildingSMART/IFC4.3.x-development).

## Repository contents

The [`models`](models/) directory organizes examples by subject, including:

* advanced and basic geometric shapes;
* alignments, linear positioning, placements, and GIS referencing;
* building elements;
* construction scheduling;
* mapped and tessellated geometry, including styles and textures;
* structural analysis models; and
* trimmed-curve parameters and basic project context information.

The [`test`](test/) directory contains additional automated checks related to alignment examples.

## Validation

All IFC sample files are validated automatically by the repository's continuous-integration workflow. The checks include:

* verify absence of UTF-8 byte order marks;
* IFC STEP syntax validation;
* validation against the current IFC 4.3 development schema and validation pipeline; and
* targeted tests for alignment structure and measure types.

On a configured Linux environment, the repository validation can be started from the repository root with:

```sh
./validate.sh
```

The script downloads the current generated schema and validation tooling, updates sample-file schema identifiers to the current identifier, and then runs the validation suite. Because it may modify `.ifc` files, review the resulting changes before committing them.

## License

Copyright © buildingSMART International Ltd. All Rights reserved until formal release. Final IFC is licensed under the **Creative Commons Attribution-NoDerivatives 4.0 International License (CC BY-ND 4.0)**.
