Return-Path: virtio-comment-return-1204-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AFAF6985A41
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Apr 2020 07:50:37 +0000 (UTC)
Date: Thu, 30 Apr 2020 03:50:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200430034900-mutt-send-email-mst@kernel.org>
References: <20200327103803.10460-1-alex.bennee@linaro.org>
 <20200327103803.10460-9-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200327103803.10460-9-alex.bennee@linaro.org>
Subject: Re: [virtio-comment] [RFC PATCH  8/8] Makefile: add simple make
 automation with clean target
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Mar 27, 2020 at 10:38:03AM +0000, Alex Benn=E9e wrote:
> This will remove all intermediate files in the checkout.
> ---
>  Makefile | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Makefile
>=20
> diff --git a/Makefile b/Makefile
> new file mode 100644
> index 0000000..f11d871
> --- /dev/null
> +++ b/Makefile
> @@ -0,0 +1,17 @@
> +# -*- Mode: makefile -*-
> +#
> +# Basic Makefile to aid automation of document building
> +#
> +
> +.PHONY: help
> +help:
> +=09@echo "Build the VIRTIO specification documents."
> +=09@echo ""
> +=09@echo "Possible operations are:"
> +=09@echo
> +=09@echo " $(MAKE) clean                Remove all intermediate files"
> +
> +
> +.PHONY: clean
> +clean:
> +=09@rm -f (git ls-files --others --exclude-standard)

This makefile is not going to work in a tarball, so how about
just a shell script for now? E.g. makegitclean.sh?


> --=20
> 2.20.1
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

