Return-Path: virtio-comment-return-607-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 75192985E0B
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Feb 2019 02:33:55 +0000 (UTC)
Date: Wed, 13 Feb 2019 10:33:52 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190213023352.GD14307@stefanha-x1.localdomain>
References: <20190111114200.10026-1-dgilbert@redhat.com>
 <20190111114200.10026-4-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Content-Disposition: inline
In-Reply-To: <20190111114200.10026-4-dgilbert@redhat.com>
Subject: [virtio-comment] Re: [PATCH 3/3] shared memory: Define mmio registers
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 11:42:00AM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> diff --git a/content.tex b/content.tex
> index 776162a..e2435ff 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -1641,6 +1641,33 @@ All register values are organized as Little Endian.
>      selected by writing to \field{QueueSel}.
>    }
>    \hline=20
> +  \mmioreg{SHMSel}{Shared memory region select}{0x0b0}{W}{%
> +    Writing to this register selects the shared memory region \ref{sec:B=
asic Facilities of a Virtio Device / Shared Memory Regions}
> +    following operations on \field{SHMId}, \field{SHMLenLow}, \field{SHM=
LenHigh},
> +    \field{SHMBaseLow} and \field{SHMBaseHigh} apply to. The index
> +    number of the first region is zero (0x0); note that it is a
> +    simple index that does not correspond to the \field{id}.

Why use a separate virtio-mmio index instead of the shared memory ID?
The driver would map those IDs it knows about, so I'm not sure if
enumerating them via a separate index is useful.  Plus using the ID lets
you drop one register from the interface.

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcY4IQAAoJEJykq7OBq3PInPQH/15alNxemx9bunuDcPr1Qgm0
L1PS4fLovCN/CFrmMheq/0Nb8Ek3qN19zvMXCQsCRM8FSr98A735fUmF5JnBQ0d6
BOLg8PvxXy+agYkwrqk6dtk1NyyHPFJqwXXAfyWrKWw5lcxLtq5QbucE7j4IowBU
uN6YuNqpwixTk6RG2+L0RJj4HIGm0FAIo2wzRok/FOoB18/UHVXqnHve+5SP3Q+r
t9aMcawvUkjgHjC3CpH/CXQeu5L8ForUlO3RQhbtFxt/04qb+s6yUbbVmGCdJAg+
auNCbauuyslMNK6yK1Y1usdKi8R47SfcqIUF2UZ9RBR86Cc3gwXo505qvZmCxsw=
=ii0T
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--
