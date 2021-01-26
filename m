Return-Path: virtio-comment-return-1674-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 28B81986264
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Jan 2021 11:14:40 +0000 (UTC)
Date: Tue, 26 Jan 2021 11:14:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20210126111431.GC250425@stefanha-x1.localdomain>
References: <20210122102502.90036-1-felipe@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20210122102502.90036-1-felipe@nutanix.com>
Subject: Re: [virtio-comment] [PATCH] content: Fix driver/device wording on
 ISR bits
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
To: Felipe Franciosi <felipe@nutanix.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 10:25:02AM +0000, Felipe Franciosi wrote:
> Section "ISR status capability" incorrectly worded that the bits part of
> the register allows the device to distinguish between interrupt types.
> It is the driver that needs access to that distinction, not the device.
>=20
> Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
> ---
>  content.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I think this can be merged as a typo fix without a full vote from the
Technical Committee.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAP+ZcACgkQnKSrs4Gr
c8j7yggApsC+YHGdyq2AbNh8veDgQDd38ZnmWcuVUfbS4RCG4r/3nRuwjoduD7aP
x2ZnQ7MV4OAsv9YBjrjG8yHc7+y5h4+DPqYXoVxjl+ekxsk9z1nWEe16wOswaG1m
AZMFv8cYxQ1KVQZIPOQMtr12WyqBfE9eErY8Ir1GTK9GgyvuFRz7q7smAl3tA8nM
KM3qamMwPxt9/7Vule8WMTPAio7GBFlnghi60XC5MISuKxQ1i+1DqHJptdeBpNF4
/95K4dogz2ZVXAFuVdG+MzVXUzZVhuKt+fE8xxirgNLXI2Zv2OSasBeeP8It/mTv
ThlUIwS2fVXiztGg1I7s6sChr7+rHw==
=qosL
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--

