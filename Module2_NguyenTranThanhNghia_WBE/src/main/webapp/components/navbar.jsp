<nav class="border-bottom-grey fixed-top navbar navbar-expand-lg navbar-dark bg-dark" style="margin-top: 80px; padding-left: 100px; padding-right: 100px;">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link h5 mr-3 " href="/home" style="${urlPath eq 'home' or urlPath eq '' ? 'color: #d1342f !important;' : ''} "
                >
                    Home <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link h5 mr-3" href="/employees" style="${urlPath eq 'employees' ? 'color: #d1342f !important;' : ''} "
                >
                    Employee
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link h5 mr-3" href="/customers" style="${urlPath eq 'customers' ? 'color: #d1342f !important;' : ''} "
                >
                    Customer
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link h5 mr-3" href="/services" style="${urlPath eq 'services' ? 'color: #d1342f !important;' : ''} "
                >
                    Service
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle h5 mr-3" id="navbarDropdown"
                   role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false"
                   style="${urlPath eq 'contracts' ? 'color: #d1342f !important;' : ''} "
                >
                    Contract
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/contracts">Contract</a>
                    <a class="dropdown-item" href="/contract-details">Contract Details</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="/${urlPath}" method="get">
            <input type="hidden" name="action" value="search">
            <input name="w" class="form-control mr-sm-2 bg-dark btn-outline-light" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>