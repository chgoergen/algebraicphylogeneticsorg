### A Pluto.jl notebook ###
# v0.20.4

using Markdown
using InteractiveUtils

# ╔═╡ a1b2c3d4-0001-0000-0000-000000000001
md"""
# Algebraic Phylogenetics with OSCAR

This notebook is a companion to the **Algebraic Phylogenetics Database** at
[algebraicphylogenetics.org](https://algebraicphylogenetics.org).

It demonstrates how to load and work with the pre-computed phylogenetic models
available for download on that website, using the
[OSCAR computer algebra system](https://oscar-system.org).

> **Note:** The algebraic phylogenetics functionality is currently available in a
> development branch of OSCAR (not yet merged into the official release).
> This notebook installs it automatically — just run all cells in order.
"""

# ╔═╡ a1b2c3d4-0002-0000-0000-000000000001
md"""
## 1. Environment Setup

The cell below installs the required development version of OSCAR.
**This only needs to run once** — Pluto will cache the environment for future sessions.

⚠️ *First-time installation may take several minutes as OSCAR and its dependencies compile.*
"""

# ╔═╡ a1b2c3d4-0003-0000-0000-000000000001
begin
	import Pkg
	# Install the development branch of OSCAR containing algebraic phylogenetics support.
	Pkg.add(url="https://github.com/marinagarrote/Oscar.jl", rev="load_phylogenetics_data-dev")
	Pkg.add("Pluto")   # Ensures Pluto itself is in the environment
	Pkg.instantiate()
	using Oscar
	println("OSCAR loaded successfully. Version: ", pkgversion(Oscar))
end

# ╔═╡ a1b2c3d4-0010-0000-0000-000000000001
md"""
## 2. Loading a Model from a Downloaded `.mrdi` File

After downloading a `.mrdi` file from the database, you can load it directly.
The example below assumes you have placed the file in the same directory as this notebook.
"""

# ╔═╡ a1b2c3d4-0011-0000-0000-000000000001
# Edit the filename to match the file you downloaded:
model_file = "SmallGroupBasedModel_4-0-0-0-0-1-0-CFN.mrdi"

# ╔═╡ a1b2c3d4-0012-0000-0000-000000000001
# Load the model (uncomment once you have the file):
# model = load(model_file)

# ╔═╡ a1b2c3d4-0013-0000-0000-000000000001
md"""
Once loaded, you can inspect the model's components:

```julia
# View the underlying phylogenetic graph:
graph(model)

# View the group-based model structure (root distribution, transition matrices, Fourier parameters):
group_based_phylogenetic_model(model)

# Retrieve the vanishing ideal (the algebraic invariants):
vanishing_ideal(model)
```
"""

# ╔═╡ a1b2c3d4-0020-0000-0000-000000000001
md"""
## 3. Querying Models from OscarDB

You can also query the OSCAR database directly, without downloading files manually.
Currently, only trees and networks under the **CFN model** are available in OscarDB.
"""

# ╔═╡ a1b2c3d4-0021-0000-0000-000000000001
# Connect to OscarDB and query for CFN models on 4-leaf trees:
begin
	db = Oscar.OscarDB.get_db()
	collection = db["AlgebraicStatistics.SmallGroupBasedModels"]

	# Find all 4-leaf trees with CFN model and level 0 (trees, no reticulations):
	query = Oscar.OscarDB.find(collection, Dict(
		"data.model_type" => "CFN",
		"data.level"      => 0,
		"data.n_leaves"   => 4
	))
	results = collect(query)
end

# ╔═╡ a1b2c3d4-0022-0000-0000-000000000001
# Retrieve a specific model by its identifier:
begin
	q = Oscar.OscarDB.find(collection, Dict("data.model_encoding" => "4-0-0-0-0-1-0-CFN"))
	my_model = first(q)
end

# ╔═╡ a1b2c3d4-0030-0000-0000-000000000001
md"""
## 4. Working with the Model

Once you have a model (either from a file or OscarDB), you can compute
its algebraic invariants directly in OSCAR. See documentation [here](https://docs.oscar-system.org/dev/Experimental/AlgebraicStatistics/phylogenetics/)

> **Note:** These computations can be very resource-intensive for larger trees.
> We recommend using the pre-computed values from the database whenever possible.
"""

# ╔═╡ a1b2c3d4-0031-0000-0000-000000000001
# Extract the interactive model object from the loaded data.
# (Use phylogenetic_model(my_model) if the file is a general, non-group-based model)
PM = group_based_phylogenetic_model(my_model)


# ╔═╡ a1b2c3d4-0032-0000-0000-000000000001
md"""
You can now use `PM` to compute or retrieve various invariants. Common functions include:

* `graph(PM)` – View the underlying tree or network.
* `vanishing_ideal(PM)` – Get the vanishing ideal of the model.
* `parametrization(PM)` – Get the probability parametrization.

For the full list of functions, see the [OSCAR Phylogenetics documentation](https://docs.oscar-system.org/dev/Experimental/AlgebraicStatistics/phylogenetics/).
"""

# ╔═╡ a1b2c3d4-0040-0000-0000-000000000001
md"""
## 5. Further Resources

- 📖 **Database website:** [algebraicphylogenetics.org](https://algebraicphylogenetics.org)
- 📄 **Database paper:** Bacher, T., Garrote-López, M., Görgen, C., and Neubert, M. J. (2026).
  "Making mathematical online resources FAIR: at the example of small phylogenetic trees."
  [*Notices of the AMS*](https://arxiv.org/abs/2601.15807), May 2026, pp. 377–387.
- 📖 **OSCAR documentation for algebraic phylogenetics:**
  [docs.oscar-system.org/.../phylogenetics](https://docs.oscar-system.org/dev/Experimental/AlgebraicStatistics/phylogenetics/)
- 📄 **Accompanying paper:** Boege, T., Della Vecchia, A., Garrote-López, M., and Hollering, B. (2026).
  "Algebraic statistics in OSCAR." [arXiv:2601.15807](https://arxiv.org/abs/2601.15807)
- 📖 **OSCAR documentation for OscarDB:**
  [docs.oscar-system.org/.../oscardb](https://docs.oscar-system.org/dev/Experimental/OscarDB/introduction/)
"""

# ╔═╡ Cell order:
# ╟─a1b2c3d4-0001-0000-0000-000000000001
# ╟─a1b2c3d4-0002-0000-0000-000000000001
# ╠═a1b2c3d4-0003-0000-0000-000000000001
# ╟─a1b2c3d4-0010-0000-0000-000000000001
# ╠═a1b2c3d4-0011-0000-0000-000000000001
# ╠═a1b2c3d4-0012-0000-0000-000000000001
# ╟─a1b2c3d4-0013-0000-0000-000000000001
# ╟─a1b2c3d4-0020-0000-0000-000000000001
# ╠═a1b2c3d4-0021-0000-0000-000000000001
# ╠═a1b2c3d4-0022-0000-0000-000000000001
# ╟─a1b2c3d4-0030-0000-0000-000000000001
# ╠═a1b2c3d4-0031-0000-0000-000000000001
# ╟─a1b2c3d4-0032-0000-0000-000000000001
# ╟─a1b2c3d4-0040-0000-0000-000000000001
