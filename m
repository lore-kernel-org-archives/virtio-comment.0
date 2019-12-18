Return-Path: virtio-comment-return-999-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3725A985EFF
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Dec 2019 15:17:01 +0000 (UTC)
Date: Wed, 18 Dec 2019 10:16:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191218101545-mutt-send-email-mst@kernel.org>
References: <20191218131151.177694-1-keiichiw@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191218131151.177694-1-keiichiw@chromium.org>
Subject: Re: [virtio-comment] [PATCH v2] content: Reserve device ID for video
 encoder and decoder device
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Keiichi Watanabe <keiichiw@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, acourbot@chromium.org, alexlau@chromium.org, dmitry.sepp@opensynergy.com, egranata@google.com, kraxel@redhat.com, posciak@chromium.org, stevensd@chromium.org, tfiga@chromium.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Dec 18, 2019 at 10:11:51PM +0900, Keiichi Watanabe wrote:
> Reserve device ID 30 for video encoder device and 31 for video decoder de=
vice.
>=20
> Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>

So given it's end of year, I suggest you wait a couple of
weeks then request TC voted on the resolution.
When you do you need to reply to this mail with
a fixes tag. E.g.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/67

on a line by it's own.

> ---
>  content.tex | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/content.tex b/content.tex
> index d68cfaf..556b373 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2721,6 +2721,10 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  28         &   RPMB device \\
>  \hline
> +30         &   Video encoder device \\
> +\hline
> +31         &   Video decoder device \\
> +\hline
>  \end{tabular}
> =20
>  Some of the devices above are unspecified by this document,
> --=20
> 2.24.1.735.g03f4e72817-goog
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

