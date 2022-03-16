Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [virtio-comment] [PATCH v3 2/4] Add PCI configuration field "queue_indirect_size"
Date: Wed, 16 Mar 2022 15:41:37 +0100
Message-ID: <6125649.aIbiLxCPU2@silver>
In-Reply-To: <4039165.kLxTS2yZ8p@silver>
References: <4735344.EBYxvr1mta@silver> <4039165.kLxTS2yZ8p@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mittwoch, 16. M=E4rz 2022 14:50:22 CET Christian Schoenebeck wrote:
> This new PCI configuration field allows to negotiate a more fine
> graded maximum lenght of indirect descriptor chains.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  content.tex | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 685525d..5162e2b 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -902,6 +902,7 @@ \subsubsection{Common configuration structure
> layout}\label{sec:Virtio Transport le64 queue_device;              /*
> read-write */
>          le16 queue_notify_data;         /* read-only for driver */
>          le16 queue_reset;               /* read-write */
> +        le32 queue_indirect_size;       /* read-write */
>  };
>  \end{lstlisting}
[...]
> @@ -6870,10 +6888,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserve=
d Feature Bits}
>    to the 16-bit size of a descriptor's "next" field there is still an ab=
solute
>    limit of $2^{16}$ descriptors per indirect descriptor table. However t=
he
>    actual maximum amount supported by either device or driver might be le=
ss,
> -  and therefore the bus specific Queue Indirect Size value MUST addition=
ally
> -  be negotiated if VIRTIO_RING_F_INDIRECT_SIZE was negotiated to subsequ=
ently
> -  negotiate the actual amount of maximum indirect descriptors supported
> -  by both sides.
> +  and therefore the transport specific Queue Indirect Size value MUST
> +  additionally be negotiated if VIRTIO_RING_F_INDIRECT_SIZE was negotiat=
ed to
> +  subsequently negotiate the actual amount of maximum indirect descripto=
rs
> +  supported by both sides.

Oops, I accidentally squashed that change (s/bus/transport/) into this PCI
patch instead of patch 1 as it was supposed to.

I'll wait though if there is still something to address on CCW patch 4 befo=
re
posting a v4.

Best regards,
Christian Schoenebeck


