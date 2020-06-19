Return-Path: virtio-comment-return-1323-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 676D098612F
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jun 2020 17:51:48 +0000 (UTC)
References: <20200618082150.17476-1-david@redhat.com>
 <20200618082150.17476-3-david@redhat.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
In-reply-to: <20200618082150.17476-3-david@redhat.com>
Date: Fri, 19 Jun 2020 18:51:38 +0100
Message-ID: <87wo43t045.fsf@linaro.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v2 2/3] conformance: Reference RPMB
 Driver Conformance
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: David Hildenbrand <david@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Yang Huang <yang.huang@intel.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


David Hildenbrand <david@redhat.com> writes:

> We forgot to reference the driver conformance.
>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Cc: Yang Huang <yang.huang@intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  conformance.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/conformance.tex b/conformance.tex
> index ed7d77f..ea48d2d 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -24,7 +24,8 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
>  \ref{sec:Conformance / Driver Conformance / SCSI Host Driver Conformance=
},
>  \ref{sec:Conformance / Driver Conformance / Input Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / Crypto Driver Conformance},
> -\ref{sec:Conformance / Driver Conformance / Socket Driver Conformance} o=
r
> +\ref{sec:Conformance / Driver Conformance / Socket Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / RPMB Driver Conformance} or
>  \ref{sec:Conformance / Driver Conformance / IOMMU Driver Conformance}.
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional D=
evice and Transitional Driver Conformance}.
>    \end{itemize}


--=20
Alex Benn=C3=A9e

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

